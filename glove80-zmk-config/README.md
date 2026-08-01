# Glove80 ZMK config (Goku-mirrored)

Keymap in `config/glove80.keymap`: **stock MoErgo non-letter keys** (Magic, Lower, Escape,
Tab, thumbs, mods, punctuation, etc.), with Goku simlayers only on the **letter** hold-keys.

Hold a letter + tap another key for the same shortcut Goku does on the Mac keyboard.
Tap a letter alone to type it. `;` still types `;` (hold `;` for Goku’s 1–5 layer).

## Building firmware

This folder lives inside the parent `~/.config` git repo (not its own GitHub repo). The nested
MoErgo GitHub Action was removed; builds run from the **parent** repo.

### Option A — GitHub Actions (recommended)

1. Commit and push changes under `glove80-zmk-config/` to `its-colby/.config`.
2. Open the repo on GitHub → **Actions** → **Build Glove80 firmware**.
3. Download the `glove80.uf2` artifact.
4. Flash both halves per [MoErgo Glove80 support](https://moergo.com/glove80-support).

Workflow file: `~/.config/.github/workflows/glove80.yml`  
(Only runs when this folder or the workflow file changes, or via **Run workflow**.)

### Option B — Local Docker build

Requires Docker Desktop (or Colima) and a few GB of disk for the first image build:

```bash
cd ~/.config/glove80-zmk-config
./build.sh
# produces ./glove80.uf2
```

### Option C — Local Nix build

```bash
cd ~/.config/glove80-zmk-config
git clone --depth 1 https://github.com/moergo-sc/zmk src
# after installing Nix + `cachix use moergo-glove80-zmk-dev`
nix-build config -o combined
cp combined/glove80.uf2 ./glove80.uf2
```

## Unicode symbol layers (V / C / X / D angles)

Goku pastes Unicode via the clipboard. Firmware instead types code points with **macOS Unicode
Hex Input** (hold Option → type hex → release). Add that input source in System Settings if you
need those symbols; letter/navigation/editing layers do not depend on it.

## Layer map (hold key)

| Hold | Layer |
|------|--------|
| F | text editing |
| D | dual punctuation `()[]{}` etc. |
| S | solo punctuation |
| A | 6–0 / ∞ / ∅ |
| R | recording shortcuts |
| V | relations (Unicode) |
| C | operators (Unicode) |
| X | logic (Unicode) |
| G | left-hand shift for right keys |
| J | text navigation |
| K | tab / tmux / Arc |
| L | Aerospace |
| `;` | 1–5 |
| U | file navigation |
| I | text selection |
| O | audio / brightness |
| H | right-hand shift for left keys |

`P` has a Goku simlayer stub with no rules, so it is left as a normal key here.
