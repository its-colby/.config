-- App open/focus + Vestnik Russian + Glove80 unicode symbols.
-- Window management is Aerospace.
--
-- OS input source: plain U.S. is fine (Unicode Hex Input no longer required).
-- Graphite is per-keyboard (Goku builtin / ZMK Glove80).
--
-- Glove80 unicode (math / IPA / logic / stress): F15 + 4 hex → unicode_leader.lua
-- Russian Vestnik:
--   Glove80: F16 on / F17 off (with Russian layer)
--   Mac builtin: hold Graphite X, tap Graphite H (phys J) → F18 → toggle
--
-- Reload: Hammerspoon menu → Reload Config; run `goku` after karabiner.edn edits
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

-- Unicode leader before Vestnik so F15/hex win over Cyrillic remap
local unicode_leader = require("unicode_leader")
unicode_leader.start()

local vestnik = require("vestnik")
vestnik.start()

hs.alert.show("Hammerspoon: apps + Vestnik + unicode", 1.2)
