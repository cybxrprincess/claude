# ✨ Spinner Words

Whimsical -ing words (and tips) for the Claude Code spinner, in the spirit of "Canoodling…".

## Layout

| Path | What it is |
| --- | --- |
| `words/*.txt` | Word lists by vibe: `cozy`, `chaotic`, `money`. One word per line. |
| `tips.txt` | Custom spinner tips, shown with the label "Vibe check". |
| `build.sh` | Builds `.claude/settings.json` from the word lists and tips. |
| `install.sh` | Merges the built settings into your user-level `~/.claude/settings.json` (needs `jq`). |
| `spin.sh` | Terminal demo: random spinner style (dots, star, arc, moon, hearts, bar), random word, random color. |

## Use it

```bash
./build.sh                # all categories
./build.sh cozy money     # just some vibes
MODE=replace ./build.sh chaotic   # only your words, no defaults
./install.sh              # apply everywhere, then restart Claude Code
./spin.sh [category]      # watch a demo
```

The built `.claude/settings.json` applies automatically inside this project.

## Notes

- `spinnerVerbs` takes `{ "mode": "append" | "replace", "verbs": [...] }`. `spinnerTipsOverride` takes `{ "tips": [...], "label": "...", "excludeDefault": true | false }`.
- The animation frames in `spin.sh` come from [cli-spinners](https://github.com/sindresorhus/cli-spinners). Claude Code's own spinner glyphs aren't configurable, only its words and tips.
- Add your own words to a file in `words/`, run `./build.sh`, and commit.
