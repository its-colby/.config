-- Vestnik (Вестник) Cyrillic via eventtap.
--
-- Enable / disable:
--   Glove80 Russian layer → F16 on / F17 off (firmware)
--   Mac builtin → hold G, tap K → F18 (Goku) → toggle
--
-- QWERTY finger map (same positions as the old Graphite Vestnik):
--   QWERTY QWERT YUIOP → цдргих фпая э*
--   ASDFGHJKL;         → стнкб ь*воеи
--   ZXCVBNM,./         → ш*злмч жйыую
-- Extras: hold ш(Z)→щ, ь(H)→ъ, э(P)→ё (Shift+hold → caps)
-- Stress: Mac hold Space → ́ ; Glove80 LT5 tap → ́
-- Layer keys: tap → Cyrillic, hold → silence so layers still work

local M = {}

local enabled = false
local tap = nil
local vestnikMap = nil
local holdExtras = nil
local layerKeys = nil

local HOLD_S = 0.18
-- { keyCode, upper, timer, fired, kind = "extra"|"layer"|"stress", extra = optional }
local holdState = nil

local function buildMap()
  local kc = hs.keycodes.map
  return {
    -- top: Q W E R T Y U I O (P = hold-extra э)
    [kc.q] = { "ц", "Ц" },
    [kc.w] = { "д", "Д" },
    [kc.e] = { "р", "Р" },
    [kc.r] = { "г", "Г" },
    [kc.t] = { "х", "Х" },
    [kc.y] = { "ф", "Ф" },
    [kc.u] = { "п", "П" },
    [kc.i] = { "а", "А" },
    [kc.o] = { "я", "Я" },
    -- home: A S D F G (H = hold-extra ь) J K L ;
    [kc.a] = { "с", "С" },
    [kc.s] = { "т", "Т" },
    [kc.d] = { "н", "Н" },
    [kc.f] = { "к", "К" },
    [kc.g] = { "б", "Б" },
    [kc.j] = { "в", "В" },
    [kc.k] = { "о", "О" },
    [kc.l] = { "е", "Е" },
    [kc[";"]] = { "и", "И" },
    -- bottom: (Z = hold-extra ш) X C V B N M , . /
    [kc.x] = { "з", "З" },
    [kc.c] = { "л", "Л" },
    [kc.v] = { "м", "М" },
    [kc.b] = { "ч", "Ч" },
    [kc.n] = { "ж", "Ж" },
    [kc.m] = { "й", "Й" },
    [kc[","]] = { "ы", "Ы" },
    [kc["."]] = { "у", "У" },
    [kc["/"]] = { "ю", "Ю" },
    -- punct (unchanged keys)
    [kc["["]] = { "«", "«" },
    [kc["]"]] = { "»", "»" },
    [kc["'"]] = { ",", "—" },
    [kc["\\"]] = { ".", ";" },
  }
end

local function buildHoldExtras()
  local kc = hs.keycodes.map
  return {
    [kc.z] = { tap = { "ш", "Ш" }, hold = { "щ", "Щ" } },
    [kc.h] = { tap = { "ь", "Ь" }, hold = { "ъ", "Ъ" } },
    [kc.p] = { tap = { "э", "Э" }, hold = { "ё", "Ё" } },
  }
end

local function buildLayerKeys()
  local kc = hs.keycodes.map
  -- QWERTY holds that open layers (must not emit Cyrillic on hold)
  local list = {
    kc.r, kc.e, kc.w, -- dual/solo/logic
    kc.u, kc.i, kc.o, -- math / IPA
    kc.f, kc.d, kc.s, kc.a, -- apps / nav / window
    kc.j, kc.k, kc.l, kc[";"], -- browser / clipboard / selection / find
    kc.g, -- G-leader (mouse / vestnik)
    kc.m, -- Word-Del hold
    kc[","], -- Word-Nav hold
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

-- Combining acute (U+0301) attaches to the character before the cursor.
-- Do NOT use clipboard select/copy/paste — restoring the pasteboard races Cmd+V
-- and pastes whatever was on the clipboard (the LT5 bug).
local function applyStressToPrevious()
  postChar(acuteMark())
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
  hs.alert.closeAll()
  hs.alert.show("Russian", 0.6)
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
  hs.alert.closeAll()
  hs.alert.show("English", 0.6)
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
