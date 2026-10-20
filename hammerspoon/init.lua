-- App open/focus + Vestnik Russian + Glove80 unicode symbols.
-- Window management is Aerospace.
--
-- OS input source: U.S. QWERTY. Layers keep the same finger positions as before.
--
-- Glove80 unicode (math / IPA / logic / stress): F15 + 4 hex → unicode_leader.lua
-- Russian Vestnik:
--   Glove80: F16 on / F17 off (with Russian layer)
--   Mac builtin: hold G, tap K → F18 → toggle
-- Mouse click-lock: Goku F19 down / F20 up (while mouse layer on)
-- Layer HUD: Shift+F18 mouse · Shift+F16 game (same F-key listen as Vestnik F18)
--
-- Reload: Hammerspoon menu → Reload Config; run `goku` after karabiner.edn edits
-- Symlink: ln -sf ~/.config/hammerspoon/init.lua ~/.hammerspoon/init.lua

hs.allowAppleScript(true)

local hyper = {"ctrl", "alt", "cmd", "shift"}
local bin = os.getenv("HOME") .. "/.config/bin/open-or-focus"
local configDir = os.getenv("HOME") .. "/.config/hammerspoon"

local function openOrFocus(target)
  hs.task.new(bin, nil, {target}):start()
end

local appBindings = {
  ["1"] = "cursor-itscolby",
  ["2"] = "cursor-mopaverse",
  ["3"] = "cursor-config",
  ["4"] = "ghostty",
  q = "whatsapp",
  w = "github",
  e = "gmail",
  r = "calendar",
  t = "chatgpt",
  y = "youtube",
  u = "russian-dict",
  i = "life",
  o = "messages",
  p = "spotify",
}

for key, target in pairs(appBindings) do
  hs.hotkey.bind(hyper, key, function()
    openOrFocus(target)
  end)
end

package.path = configDir .. "/?.lua;" .. package.path

-- Unicode leader before Vestnik so F15/hex win over Cyrillic remap
local unicode_leader = require("unicode_leader")
unicode_leader.start()

local vestnik = require("vestnik")
vestnik.start()

local function layerHud(msg)
  hs.alert.closeAll()
  hs.alert.show(msg, 0.6)
end

-- Mouse layer: S = hold left click, H = release (Goku sends F19/F20)
hs.hotkey.bind({}, "f19", function()
  local p = hs.mouse.absolutePosition()
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, p):post()
end)
hs.hotkey.bind({}, "f20", function()
  local p = hs.mouse.absolutePosition()
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, p):post()
end)

-- Goku + Glove80 emit Shift+F18 (mouse) / Shift+F16 (game); same listen path as Vestnik F18
local mouseLayerOn = false
local gameLayerOn = false
hs.hotkey.bind({ "shift" }, "f18", function()
  mouseLayerOn = not mouseLayerOn
  layerHud(mouseLayerOn and "Mouse" or "Default")
end)
hs.hotkey.bind({ "shift" }, "f16", function()
  gameLayerOn = not gameLayerOn
  layerHud(gameLayerOn and "Game" or "Default")
end)

-- Caps Lock HUD (Mac Caps key + Glove80 LT1/RT1 tap). Debounce press/release.
local capsHudOn = hs.hid.capslock.get()
local capsCode = hs.keycodes.map.capslock or hs.keycodes.map.capsLock or 57
local capsTap = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(e)
  if e:getKeyCode() ~= capsCode then
    return false
  end
  hs.timer.doAfter(0.02, function()
    local on = hs.hid.capslock.get()
    if on == capsHudOn then
      return
    end
    capsHudOn = on
    layerHud(on and "Caps" or "Default")
  end)
  return false
end)
capsTap:start()

hs.alert.show("Hammerspoon: apps + Vestnik + unicode", 1.2)
