# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a VS Code Dev Container environment for authoring Typst documents. The primary use case is academic documents (case studies, theses) written in Czech for VŠE (Prague University of Economics).

## Build Commands

```bash
# Compile Typst document to PDF
typst compile src/main.typ src/main.pdf

# Watch for changes and auto-compile
typst watch src/main.typ src/main.pdf
```

## Development Environment

- **Container**: Based on `ghcr.io/typst/typst:0.14.2` (Alpine Linux)
- **Typst Version**: 0.14.2
- **VS Code Extension**: Tinymist (`myriad-dreamin.tinymist`) - provides LSP, formatting, and auto-export on save
- **Formatter**: typstyle (configured via Tinymist)
- **Auto-export**: PDF exports automatically on file save
- **Fonts**: New Computer Modern (serif), Liberation Sans (sans-serif for headings)

## Project Structure

- `src/main.typ` - Main thesis document (uses the template)
- `src/main.pdf` - Compiled PDF output
- `src/template/` - VŠE thesis template
  - `lib.typ` - Public API entry point
  - `thesis.typ` - Main template function
  - `title-page.typ` - Title page layout
  - `front-matter.typ` - AI declaration, acknowledgements, abstracts
  - `locale.typ` - Trilingual strings (cze/slo/eng)
  - `styles.typ` - Heading, caption, header/footer styles
- `src/img/` - Logo images (FIS CZ/EN)
- `src/references.bib` - Bibliography database
- `_original_latex/` - Original LaTeX template (visual reference only)
- `.devcontainer/` - Dev container configuration

## Typst Language Notes

Typst is a modern typesetting system (alternative to LaTeX). Key syntax:
- `#set` - Configure document settings (page, text, headings)
- `#figure` with `table` - Create tables with captions
- `$...$` - Math expressions
- `=` / `==` / `===` - Heading levels
- `#pagebreak()` - Page breaks
- `#align(center)[...]` - Alignment blocks
