# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a VS Code Dev Container environment for authoring Typst documents. The primary use case is academic documents (case studies, theses) written in Czech for VŠE (Prague University of Economics).

## Build Commands

```bash
# Compile thesis to PDF (PDF/A-2u)
task build

# Watch for changes and auto-compile
task watch
```

Defined in `Taskfile.yml`. Run `task --list` to see all available tasks.

## Development Environment

- **Container**: Based on `ghcr.io/typst/typst:0.14.2` (Alpine Linux)
- **Typst Version**: 0.14.2
- **VS Code Extension**: Tinymist (`myriad-dreamin.tinymist`) - provides LSP, formatting, and auto-export on save
- **Tinymist Root**: Set to `src` so path resolution matches the CLI (`tinymist.rootPath: "src"`)
- **Formatter**: typstyle (configured via Tinymist)
- **Auto-export**: PDF exports automatically on file save
- **Fonts**: New Computer Modern (serif), Liberation Sans (sans-serif for headings)

## Project Structure

- `src/main.typ` - Main thesis document (uses the template)
- `src/template/` - VŠE thesis template
  - `lib.typ` - Public API entry point (exports `vse-thesis`, `code-figure`)
  - `thesis.typ` - Main template function
  - `title-page.typ` - Title page layout
  - `front-matter.typ` - AI declaration, acknowledgements, abstracts
  - `locale.typ` - Trilingual strings (cze/slo/eng)
  - `styles.typ` - Heading, caption, header/footer styles
- `src/img/` - Logo images (`fis-logo-cz.png`, `fis-logo-en.png`)
- `src/references.bib` - Bibliography database
- `docs/typst-guide.md` - Comprehensive Typst language reference
- `_original_latex/` - Original LaTeX template (visual reference only)
- `.devcontainer/` - Dev container configuration

## Path Resolution

Template files use **relative paths** from `src/template/`:
- Logos: `../img/fis-logo-cz.png`
- Bibliography: `../references.bib`

This ensures paths work in both CLI (`typst compile src/main.typ`) and Tinymist (VS Code).

## Typst Language Reference

See `docs/typst-guide.md` for a comprehensive Typst reference (syntax, set/show rules, templates, math, tables, figures, context/introspection, etc.).
