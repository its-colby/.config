-- App open/focus + Vestnik Russian (Glove80). Window management is Aerospace.
--
-- OS input source: Unicode Hex Input (or U.S.) for Latin / math / IPA macros.
-- Graphite is per-keyboard (Goku builtin / ZMK Glove80). Russian does NOT use
-- Hex macros — see vestnik.lua (F16 on / F17 off from the keyboard).
--
-- Reload: Hammerspoon menu → Reload Config
-- Symlink: ln -sf ~/.config/hammerspoon/init.lua ~/.hammerspoon/init.lua

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
local vestnik = require("vestnik")
vestnik.start()

hs.alert.show("Hammerspoon: apps + Vestnik", 1.2)
