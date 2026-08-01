# Voice Commands

One-word phrase on the left, natural-language directive on the right. All phrases are unique unless noted.

## Modes

These are built into macOS Voice Control (no custom import needed):

```
Command mode = Respond only to commands; do not dictate text
Dictation mode = Dictate text; still recognize commands
```

Say **Command mode** when you want to control the Mac without typing spoken words into the focused field. Say **Dictation mode** when you want speech entered as text again.

## Window Management

```
left = Focus the window to the left
right = Focus the window to the right
tile = Tile the windows
split = Split the windows
dismiss = Close the focused Aerospace window (quits the app if it is the last window)
primary = Switch to workspace 1
secondary = Switch to workspace 2
park = Move the focused window to workspace 1
stash = Move the focused window to workspace 2
grow = Make the focused window larger
shrink = Make the focused window smaller
rail = Toggle the sidebar
terminal = Toggle the terminal
```

### Variable resize

After `grow` or `shrink`, you can say the built-in **Repeat two times**, **Repeat three times**, and so on.

Or use these explicit phrases (each runs the resize that many times via Aerospace):

```
grow two times = Make the focused window larger, twice
grow three times = Make the focused window larger, three times
grow four times = Make the focused window larger, four times
grow five times = Make the focused window larger, five times
shrink two times = Make the focused window smaller, twice
shrink three times = Make the focused window smaller, three times
shrink four times = Make the focused window smaller, four times
shrink five times = Make the focused window smaller, five times
```

## Cursor Focus

Focus Cursor panels directly (works while Cursor is frontmost):

```
browse = Focus the file explorer sidebar
prompt = Focus the AI chat / composer input
buffer = Focus the active file editor
console = Focus the terminal panel
```

Use `browse` then arrow keys / enter to move around files. Use `prompt` and `buffer` to jump back and forth between the AI input and the file. Use `console` for the terminal (distinct from `terminal`, which toggles visibility).

## Tabs & Browser (Arc / Cursor / tmux)

Mapped to your Goku Ctrl-Option tab layer:

```
flip = Focus the next tab
flop = Focus the previous tab
spawn = Open a new tab
snuff = Close the focused tab (does not quit the app)
desks = Switch spaces
halve = Split the view horizontally
unite = Escape split view
jump = Navigate to the next link
prior = Navigate to the previous link
```

## Closing: dismiss vs snuff

- **dismiss** — closes the focused **window** via Aerospace (`close --quit-if-last-window`). If that was the app’s last window, the app quits.
- **snuff** — closes the focused **tab** / pane (Arc tab, Cursor editor tab, tmux pane). The app stays open.

## Text Navigation

```
west = Move the cursor left by one character
east = Move the cursor right by one character
north = Move the cursor up one line
south = Move the cursor down one line
retreat = Move the cursor left by one word
advance = Move the cursor right by one word
onset = Move the cursor to the beginning of the line
terminus = Move the cursor to the end of the line
rise = Scroll up by one screen
fall = Scroll down by one screen
zenith = Scroll to the top of the page
floor = Scroll to the bottom of the page
```

## Text Selection

```
blanket = Select all text
nip = Extend the selection left by one character
tug = Extend the selection right by one character
hoist = Extend the selection up by one line
lower = Extend the selection down by one line
reclaim = Extend the selection left by one word
annex = Extend the selection right by one word
encompass = Extend the selection to the beginning of the line
harvest = Extend the selection to the end of the line
term = Select the current word
glyph = Select the current character
row = Select the current line
unmark = Collapse the selection without deleting it
```

## Clipboard

```
copy = Copy the selected text
cut = Cut the selected text
paste = Paste from the clipboard
stencil = Paste from the clipboard without formatting
```

## Text Editing

```
delete = Delete the character before the cursor
expunge = Delete the character after the cursor
lop = Delete the word before the cursor
shear = Delete the word after the cursor
clip = Delete from the cursor to the beginning of the line
chop = Delete from the cursor to the end of the line
enter = Press return
break = Insert a new line
tab = Insert a tab
indent = Indent the current line or selection
dedent = Dedent the current line or selection
undo = Undo the last action
redo = Redo the last undone action
save = Save the current file
escape = Press escape
comment = Toggle commenting on the current line or selection
find = Open find
substitute = Open find and replace
pursue = Jump to the next search result
retrace = Jump to the previous search result
```
