# Siege Operator Quiz

A static "guess the operator" quiz for Rainbow Six Siege. Every operator icon is
shown at once in a randomized grid; assign each one a name from the word bank and
submit for a score. No build step, no dependencies — plain HTML/CSS/JS.

**Play:** https://ashgasparyancs.github.io/siege-operator-quiz/

## How to play
- Each icon appears once, in random positions.
- Assign a name two ways: **click a name** in the word bank then **click an icon**,
  or use each icon's **dropdown**.
- Change answers freely. The same name can't be on two icons — **Submit stays
  disabled** until duplicates are resolved.
- On submit: see your score, green/red coloring, and the correct name under each icon.
- **Play again** reshuffles the grid.

## Files
| File | Purpose |
| --- | --- |
| `index.html` / `style.css` / `game.js` | The game. |
| `icons/` | Operator icons; **filename (minus `.png`) is the correct answer**. |
| `operators.txt` | Pretty display names (with accents) used for the answer labels. |
| `manifest.js` | **Auto-generated** list the game reads (GitHub Pages can't list a folder at runtime). |
| `gen_manifest.py` | Build step — scans `icons/` and rewrites `manifest.js`. |
| `publish.bat` | One-click: regenerate manifest, commit (prompts for message), push. |

## Updating the operator set
1. Add/remove PNGs in `icons/` (filename = the answer; spaces/accents are fine).
2. Optionally add the pretty name to `operators.txt`.
3. Run `python gen_manifest.py` (or just run `publish.bat`, which does it for you).

## Local preview
No Node required:
```
python -m http.server 8000
```
Then open http://localhost:8000 — open via the server (not `file://`) so the
manifest and icons load.
