# VŠE Thesis Template (Typst)

Typst template for bachelor's and master's theses at FIS VŠE (Faculty of Informatics and Statistics, Prague University of Economics and Business).

## Quick start

1. Open this repo in VS Code with the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
2. Reopen in container — Typst, fonts, and tooling are set up automatically
3. Edit `src/main.typ` with your thesis content
4. The [Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) extension is pre-installed — gives you LSP, formatting, and auto-export to PDF on save
5. Or build manually with `task build`

## Build commands

```bash
task build   # Compile to PDF (PDF/A-2u)
task watch   # Watch & auto-compile
task         # List all tasks
```

## Project structure

```
src/
├── main.typ          # Your thesis (edit this)
├── references.bib    # Bibliography
├── img/              # Logos and figures
└── template/         # VŠE thesis template
    ├── lib.typ       # Public API (vse-thesis, code-figure)
    ├── thesis.typ    # Template logic
    ├── title-page.typ
    ├── front-matter.typ
    ├── locale.typ    # Strings (cze/slo/eng)
    └── styles.typ    # Headings, captions, headers/footers
```

## Configuration

All options are set in `src/main.typ` via `vse-thesis.with(...)`:

| Parameter | Description |
|---|---|
| `title` | Thesis title |
| `author` | Author name |
| `supervisor` | Supervisor name |
| `thesis-type` | `"BP"` (bachelor's) or `"DP"` (master's) |
| `language` | `"cze"`, `"slo"`, or `"eng"` |
| `bibliography-file` | Path to `.bib` file |

See `src/main.typ` for the full list of parameters.

## Disclaimer

This template is an unofficial side project and is not affiliated with VŠE. It is provided as-is with no guarantees. Always verify that your thesis meets the current faculty requirements before submission.
