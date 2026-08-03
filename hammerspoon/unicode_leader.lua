-- Glove80 unicode symbols (math / IPA / logic / …) via F15 + 4 hex digits.
-- Firmware UC() macros send F15 then N0–N9/A–F (no Option). We assemble the
-- codepoint and type it with keyStrokes — fast, works on plain U.S. layout.
--
-- Must start before Vestnik so F15/hex are swallowed while capturing (A–F
-- would otherwise become Cyrillic if Vestnik is on).

local M = {}

local tap = nil
local capturing = false
local nibbles = {}
local timeoutTimer = nil
local hexMap = nil

local TIMEOUT_S = 0.8

local function buildHexMap()
  local kc = hs.keycodes.map
  return {
    [kc["0"]] = 0,
    [kc["1"]] = 1,
    [kc["2"]] = 2,
    [kc["3"]] = 3,
    [kc["4"]] = 4,
    [kc["5"]] = 5,
    [kc["6"]] = 6,
    [kc["7"]] = 7,
    [kc["8"]] = 8,
    [kc["9"]] = 9,
    [kc.a] = 10,
    [kc.b] = 11,
    [kc.c] = 12,
    [kc.d] = 13,
    [kc.e] = 14,
    [kc.f] = 15,
  }
end

local function cancelCapture()
  capturing = false
  nibbles = {}
  if timeoutTimer then
    timeoutTimer:stop()
    timeoutTimer = nil
  end
end

local function armTimeout()
  if timeoutTimer then
    timeoutTimer:stop()
  end
  timeoutTimer = hs.timer.doAfter(TIMEOUT_S, function()
    cancelCapture()
  end)
end

local function emitCodepoint(cp)
  if cp < 1 or cp > 0x10FFFF then
    return
  end
  local ch = hs.utf8.codepointToUTF8(cp)
  if not ch or ch == "" then
    return
  end
  tap:stop()
  hs.eventtap.keyStrokes(ch)
  tap:start()
end

local function onEvent(event)
  if event:getType() ~= hs.eventtap.event.types.keyDown then
    -- Swallow hex/F15 keyUps while capturing so they don't leak
    if capturing then
      local kc = event:getKeyCode()
      if kc == hs.keycodes.map.f15 or (hexMap and hexMap[kc] ~= nil) then
        return true
      end
    end
    return false
  end

  if not hexMap then
    hexMap = buildHexMap()
  end

  local keyCode = event:getKeyCode()
  local f15 = hs.keycodes.map.f15

  if keyCode == f15 then
    -- New codepoint sequence (also starts the second char in UC2_LEFT)
    capturing = true
    nibbles = {}
    armTimeout()
    return true
  end

  if not capturing then
    return false
  end

  local nibble = hexMap[keyCode]
  if nibble == nil then
    cancelCapture()
    return false
  end

  nibbles[#nibbles + 1] = nibble
  armTimeout()

  if #nibbles >= 4 then
    local cp = (nibbles[1] * 4096) + (nibbles[2] * 256) + (nibbles[3] * 16) + nibbles[4]
    cancelCapture()
    emitCodepoint(cp)
  end

  return true
end

function M.isCapturing()
  return capturing
end

function M.start()
  hexMap = buildHexMap()
  tap = hs.eventtap.new({
    hs.eventtap.event.types.keyDown,
    hs.eventtap.event.types.keyUp,
  }, onEvent)
  tap:start()
end

return M
