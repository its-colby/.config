-- Vestnik (Вестник) Cyrillic via eventtap — used while Glove80 Russian layer is on.
-- Firmware taps F16 on enter / F17 on leave (see glove80 russian macros).
--
-- Why not Unicode Hex? Each letter is Option+4 hex digits; fast typing interleaves
-- sequences and macOS often emits CJK (wrong codepoints). This path is one glyph
-- per key, same speed as Latin.

local M = {}

local enabled = false
local tap = nil

-- macOS keycodes → { lower, upper }
-- Graphite letter HID from Glove80 Russian layer (plain &kp, not UC macros).
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
    [kc.j] = { "э", "Э" },
    [kc.n] = { "с", "С" },
    [kc.r] = { "т", "Т" },
    [kc.t] = { "н", "Н" },
    [kc.s] = { "к", "К" },
    [kc.g] = { "б", "Б" },
    [kc.y] = { "ь", "Ь" },
    [kc.h] = { "в", "В" },
    [kc.a] = { "о", "О" },
    [kc.e] = { "е", "Е" },
    [kc.i] = { "и", "И" },
    [kc.q] = { "ш", "Ш" },
    [kc.x] = { "з", "З" },
    [kc.m] = { "л", "Л" },
    [kc.c] = { "м", "М" },
    [kc.v] = { "ч", "Ч" },
    [kc.k] = { "ж", "Ж" },
    [kc.p] = { "й", "Й" },
    [kc["."]] = { "ы", "Ы" },
    [kc["-"]] = { "у", "У" },
    [kc[";"]] = { "ю", "Ю" },
    -- Extras (Glove80 edge keys on Russian layer)
    [kc.right] = { "щ", "Щ" },
    [kc.up] = { "ъ", "Ъ" },
    [kc.down] = { "ё", "Ё" },
    [kc["["]] = { "«", "«" },
    [kc["]"]] = { "»", "»" },
    -- Punctuation keys (not Vestnik letters)
    [kc["'"]] = { ",", "—" }, -- right of I: comma / em dash
    [kc["\\"]] = { ".", ";" }, -- right of J: period / semicolon
  }
end

local vestnikMap = nil

local function onKey(event)
  if not enabled then
    return false
  end
  local keyCode = event:getKeyCode()
  local pair = vestnikMap[keyCode]
  if not pair then
    return false
  end
  local flags = event:getFlags()
  -- Let Cmd/Ctrl/Alt chords through (copy, etc.)
  if flags.cmd or flags.ctrl or flags.alt then
    return false
  end
  local ch = (flags.shift or flags.capslock) and pair[2] or pair[1]
  -- Stop tap while posting so keyStrokes cannot re-enter this handler
  tap:stop()
  hs.eventtap.keyStrokes(ch)
  tap:start()
  return true -- swallow Latin HID
end

function M.enable()
  if enabled then
    return
  end
  if not vestnikMap then
    vestnikMap = buildMap()
  end
  enabled = true
  if not tap then
    tap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, onKey)
  end
  tap:start()
  hs.alert.show("RU Vestnik", 0.6)
end

function M.disable()
  if not enabled then
    return
  end
  enabled = false
  if tap then
    tap:stop()
  end
  hs.alert.show("EN", 0.6)
end

function M.isEnabled()
  return enabled
end

function M.start()
  -- Absolute on/off from Glove80 (avoids desync vs a single toggle key)
  hs.hotkey.bind({}, "f16", function()
    M.enable()
  end)
  hs.hotkey.bind({}, "f17", function()
    M.disable()
  end)
end

return M
