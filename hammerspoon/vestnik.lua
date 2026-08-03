-- Vestnik (Вестник) Cyrillic via eventtap.
--
-- Enable / disable:
--   Glove80 Russian layer → F16 on / F17 off (firmware)
--   Mac builtin → hold Graphite X, tap Graphite H (phys J) → F18 (Goku) → toggle
--
-- Extras (no layer keys): hold ш(Q)→щ, ь(Y)→ъ, э(J)→ё (Shift+hold → caps)
-- Stress: Mac hold Space → ́ ; Glove80 Tab-thumb tap → ́ (hold Tab = Audio)
-- Layer keys (WDLFOUSTTRNHAEI): tap → letter, hold → silence so layers still work

local M = {}

local enabled = false
local tap = nil
local vestnikMap = nil
local holdExtras = nil
local layerKeys = nil

local HOLD_S = 0.2
-- { keyCode, upper, timer, fired, kind = "extra"|"layer", extra = optional }
local holdState = nil

local function buildMap()
  local kc = hs.keycodes.map
  return {
    [kc.b] = { "ц", "Ц" },
    [kc.l] = { "д", "Д" },
    [kc.d] = { "р", "Р" },
    [kc.w] = { "г", "Г" },
    [kc.z] = { "х", "Х" },
    [kc[","]] = { "ф", "Ф" },
    [kc.f] = { "п", "П" },
    [kc.o] = { "а", "А" },
    [kc.u] = { "я", "Я" },
    -- j: hold-tap э/ё (see holdExtras)
    [kc.n] = { "с", "С" },
    [kc.r] = { "т", "Т" },
    [kc.t] = { "н", "Н" },
    [kc.s] = { "к", "К" },
    [kc.g] = { "б", "Б" },
    -- y / q: hold-tap extras
    [kc.h] = { "в", "В" },
    [kc.a] = { "о", "О" },
    [kc.e] = { "е", "Е" },
    [kc.i] = { "и", "И" },
    [kc.x] = { "з", "З" },
    [kc.m] = { "л", "Л" },
    [kc.c] = { "м", "М" },
    [kc.v] = { "ч", "Ч" },
    [kc.k] = { "ж", "Ж" },
    [kc.p] = { "й", "Й" },
    [kc["."]] = { "ы", "Ы" },
    [kc["-"]] = { "у", "У" },
    [kc[";"]] = { "ю", "Ю" },
    [kc["["]] = { "«", "«" },
    [kc["]"]] = { "»", "»" },
    [kc["'"]] = { ",", "—" },
    [kc["\\"]] = { ".", ";" },
  }
end

local function buildHoldExtras()
  local kc = hs.keycodes.map
  return {
    [kc.q] = { tap = { "ш", "Ш" }, hold = { "щ", "Щ" } },
    [kc.y] = { tap = { "ь", "Ь" }, hold = { "ъ", "Ъ" } },
    [kc.j] = { tap = { "э", "Э" }, hold = { "ё", "Ё" } }, -- э has no layer
  }
end

local function buildLayerKeys()
  local kc = hs.keycodes.map
  -- Graphite letter holds that open layers (must not emit Cyrillic on hold)
  local list = {
    kc.w, kc.d, kc.l, -- dual/solo/logic
    kc.f, kc.o, kc.u, -- math / IPA
    kc.s, kc.t, kc.r, kc.n, -- apps / nav / window
    kc.h, kc.a, kc.e, kc.i, -- browser / clipboard / selection / find
  }
  local set = {}
  for _, code in ipairs(list) do
    set[code] = true
  end
  return set
end

local function postChar(ch)
  tap:stop()
  hs.eventtap.keyStrokes(ch)
  tap:start()
end

local function acuteMark()
  return hs.utf8.codepointToUTF8(0x0301)
end

-- Put combining acute on the character before the cursor (not a free-standing mark).
local function applyStressToPrevious()
  if tap then
    tap:stop()
  end
  local pb = hs.pasteboard
  local saved = pb.getContents()

  hs.eventtap.keyStroke({ "shift" }, "left", 0)
  hs.timer.doAfter(0.025, function()
    hs.eventtap.keyStroke({ "cmd" }, "c", 0)
    hs.timer.doAfter(0.025, function()
      local selected = pb.getContents()
      if not selected or selected == "" then
        hs.eventtap.keyStroke({}, "right", 0)
        if saved ~= nil then
          pb.setContents(saved)
        end
        if enabled and tap then
          tap:start()
        end
        return
      end
      local acu = acuteMark()
      local out = selected
      if not string.find(selected, acu, 1, true) then
        out = selected .. acu
      end
      pb.setContents(out)
      hs.eventtap.keyStroke({ "cmd" }, "v", 0)
      hs.timer.doAfter(0.025, function()
        if saved ~= nil then
          pb.setContents(saved)
        end
        if enabled and tap then
          tap:start()
        end
      end)
    end)
  end)
end

local function clearHold()
  if holdState and holdState.timer then
    holdState.timer:stop()
  end
  holdState = nil
end

local function isRepeat(event)
  local prop = hs.eventtap.event.properties.keyboardEventAutorepeat
  return event:getProperty(prop) ~= 0
end

local function beginHold(keyCode, upper, kind, extra)
  clearHold()
  local state = {
    keyCode = keyCode,
    upper = upper,
    fired = false,
    kind = kind,
    extra = extra,
  }
  state.timer = hs.timer.doAfter(HOLD_S, function()
    if holdState ~= state or state.fired then
      return
    end
    state.fired = true
    if kind == "extra" and extra then
      local pair = extra.hold
      postChar(state.upper and pair[2] or pair[1])
    elseif kind == "stress" then
      applyStressToPrevious()
    end
    -- kind == "layer": hold opens firmware/Goku layer; emit nothing
  end)
  holdState = state
end

local function onEvent(event)
  local ok, unicode = pcall(require, "unicode_leader")
  if ok and unicode.isCapturing and unicode.isCapturing() then
    return false
  end
  if not enabled then
    return false
  end

  if not vestnikMap then
    vestnikMap = buildMap()
  end
  if not holdExtras then
    holdExtras = buildHoldExtras()
  end
  if not layerKeys then
    layerKeys = buildLayerKeys()
  end

  local keyCode = event:getKeyCode()
  local etype = event:getType()
  local isDown = etype == hs.eventtap.event.types.keyDown
  local isUp = etype == hs.eventtap.event.types.keyUp
  local flags = event:getFlags()

  if flags.cmd or flags.ctrl or flags.alt then
    return false
  end

  local upper = flags.shift or flags.capslock or false
  local extra = holdExtras[keyCode]
  local spaceCode = hs.keycodes.map.space

  -- Mac (and any plain Space): tap = space, hold = stress mark
  if keyCode == spaceCode then
    if isDown then
      if isRepeat(event) then
        return true
      end
      beginHold(keyCode, upper, "stress", nil)
      return true
    end
    if isUp then
      if holdState and holdState.keyCode == keyCode then
        local state = holdState
        if state.timer then
          state.timer:stop()
        end
        if not state.fired then
          postChar(" ")
        end
        holdState = nil
      end
      return true
    end
  end

  -- Extra letters: tap base / hold alternate (Q Y J only — no layer keys)
  if extra then
    if isDown then
      if isRepeat(event) then
        return true
      end
      beginHold(keyCode, upper, "extra", extra)
      return true
    end
    if isUp then
      if holdState and holdState.keyCode == keyCode then
        local state = holdState
        if state.timer then
          state.timer:stop()
        end
        if not state.fired then
          local pair = extra.tap
          postChar(state.upper and pair[2] or pair[1])
        end
        holdState = nil
      end
      return true
    end
  end

  -- Layer letter keys: tap → Cyrillic, hold → no char (layer can activate)
  if layerKeys[keyCode] then
    local pair = vestnikMap[keyCode]
    if not pair then
      return false
    end
    if isDown then
      if isRepeat(event) then
        return true
      end
      beginHold(keyCode, upper, "layer", nil)
      return true
    end
    if isUp then
      if holdState and holdState.keyCode == keyCode then
        local state = holdState
        if state.timer then
          state.timer:stop()
        end
        if not state.fired then
          postChar(state.upper and pair[2] or pair[1])
        end
        holdState = nil
      end
      return true
    end
  end

  if not isDown then
    return false
  end

  local pair = vestnikMap[keyCode]
  if not pair then
    return false
  end
  postChar(upper and pair[2] or pair[1])
  return true
end

function M.enable()
  if enabled then
    return
  end
  vestnikMap = buildMap()
  holdExtras = buildHoldExtras()
  layerKeys = buildLayerKeys()
  enabled = true
  if not tap then
    tap = hs.eventtap.new({
      hs.eventtap.event.types.keyDown,
      hs.eventtap.event.types.keyUp,
    }, onEvent)
  end
  tap:start()
  hs.alert.show("RU Vestnik", 0.6)
end

function M.disable()
  if not enabled then
    return
  end
  enabled = false
  clearHold()
  if tap then
    tap:stop()
  end
  hs.alert.show("EN", 0.6)
end

function M.isEnabled()
  return enabled
end

function M.toggle()
  if enabled then
    M.disable()
  else
    M.enable()
  end
end

function M.start()
  pcall(function()
    require("hs.ipc")
  end)

  hs.hotkey.bind({}, "f14", function()
    if enabled then
      applyStressToPrevious()
    end
  end)
  hs.hotkey.bind({}, "f16", function()
    M.enable()
  end)
  hs.hotkey.bind({}, "f17", function()
    M.disable()
  end)
  hs.hotkey.bind({}, "f18", function()
    M.toggle()
  end)
end

return M
