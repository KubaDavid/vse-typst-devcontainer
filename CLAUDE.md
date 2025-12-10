# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Important: Typst Documentation

**Before doing any Typst-related work, you MUST read `docs/typst-guide.md`** - this contains comprehensive Typst documentation including syntax, styling, tables, layout, and all available functions.

## Content Policy

**STRICTLY PROHIBITED:** Any wording or text changes to the document content. Claude Code should ONLY perform Typst formatting tasks (styling, layout, tables, structure). All text content must be provided by the user - do not modify, rephrase, add, or remove any text unless explicitly instructed by the user.

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

- **Container**: Based on `ghcr.io/typst/typst:0.14.1` (Alpine Linux)
- **Typst Version**: 0.14.1
- **VS Code Extension**: Tinymist (`myriad-dreamin.tinymist`) - provides LSP, formatting, and auto-export on save
- **Formatter**: typstyle (configured via Tinymist)
- **Auto-export**: PDF exports automatically on file save

## Project Structure

- `src/main.typ` - Main Typst source document
- `src/main.pdf` - Compiled PDF output
- `.devcontainer/` - Dev container configuration

## Typst Language Notes

Typst is a modern typesetting system (alternative to LaTeX). Key syntax:
- `#set` - Configure document settings (page, text, headings)
- `#figure` with `table` - Create tables with captions
- `$...$` - Math expressions
- `=` / `==` / `===` - Heading levels
- `#pagebreak()` - Page breaks
- `#align(center)[...]` - Alignment blocks
