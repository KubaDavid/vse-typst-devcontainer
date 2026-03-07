# Typst Comprehensive Guide

A complete reference for the Typst typesetting system (version 0.14.x).

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Getting Started](#2-getting-started)
3. [Writing in Typst](#3-writing-in-typst)
4. [Formatting & Styling](#4-formatting--styling)
5. [Page Setup](#5-page-setup)
6. [Text Functions](#6-text-functions)
7. [Mathematics](#7-mathematics)
8. [Tables](#8-tables)
9. [Layout](#9-layout)
10. [Visualization](#10-visualization)
11. [Scripting](#11-scripting)
12. [Context & Introspection](#12-context--introspection)
13. [Data Loading](#13-data-loading)
14. [Foundations (Data Types)](#14-foundations-data-types)
15. [Document Model](#15-document-model)
16. [Templates](#16-templates)
17. [Symbols Reference](#17-symbols-reference)
18. [PDF & HTML Export](#18-pdf--html-export)
19. [For LaTeX Users](#19-for-latex-users)
20. [Accessibility](#20-accessibility)

---

## 1. Introduction

Typst is a modern markup-based typesetting system designed as an alternative to LaTeX. It combines the power of advanced typesetting with a simpler, more intuitive syntax.

### Key Features

- **Fast compilation** -- Incremental compilation for near-instant preview
- **Simple syntax** -- Clean markup without complex commands
- **Powerful scripting** -- Built-in programming capabilities
- **Modern tooling** -- Web app and CLI available
- **Accessible output** -- Tagged PDF with PDF/UA-1 support

### Three Modes

Typst operates in three syntactical modes:

| Mode | Purpose | Entry |
|------|---------|-------|
| **Markup** | Document content (default) | Default mode, or `[..]` from code |
| **Code** | Programming and logic | `#` prefix from markup |
| **Math** | Mathematical formulas | `$...$` delimiters |

Once in code mode with `#`, additional hashes are not needed unless returning to markup or math.

---

## 2. Getting Started

### Basic Syntax Overview

```typst
// This is a comment
/* This is a
   block comment */

= This is a Heading

This is a paragraph. Leave a blank line to start a new paragraph.

This is another paragraph with *strong* and _emphasized_ text.
```

### Escape Sequences

- Backslash `\` escapes special characters: `\#`, `\*`, `\_`, `\$`
- Unicode: `\u{1f600}` for emoji/special characters
- In strings: `\\`, `\"`, `\n`, `\r`, `\t`, `\u{hex}`

### Identifiers

Variable and function names can contain:
- Letters (including Unicode)
- Numbers (not at start)
- Hyphens and underscores

Convention: **kebab-case** (e.g., `top-edge`, `my-variable`).

```typst
#let my-variable = "value"
#let _private = 42
#let π = calc.pi
```

### Paths

- **Relative paths**: `"image.png"` (from current file's directory)
- **Absolute paths**: `"/assets/image.png"` (from project root)
- Default project root is the parent directory of the main Typst file
- CLI flag `--root` overrides the root: `typst compile --root .. file.typ`
- No files outside the root are readable (security sandbox)

---

## 3. Writing in Typst

### Headings

```typst
= Level 1 Heading
== Level 2 Heading
=== Level 3 Heading
==== Level 4 Heading

// Or function form
#heading(level: 2)[Level 2 Heading]
```

### Text Emphasis

```typst
*strong text*          // Bold
_emphasized text_      // Italic
*_strong and italic_*  // Combined
```

### Lists

**Bullet lists:**
```typst
- First item
- Second item
  - Nested item
  - Another nested
- Third item
```

**Numbered lists:**
```typst
+ First item
+ Second item
  + Nested numbered
+ Third item

// Explicit numbering
1. First
2. Second

// Reversed
#set enum(reversed: true)
+ Last
+ Second to last
+ First
```

**Term lists (definitions):**
```typst
/ Term: Description of the term
/ Another term: Its description
```

### Paragraphs and Line Breaks

```typst
This is a paragraph.

This is another paragraph (blank line separates them).

Force a line break with backslash:\
This continues on a new line.
```

### Links

```typst
// Auto-detected URLs
https://typst.app/

// Named links
#link("https://typst.app/")[Typst Website]

// Internal document links
#link(<my-label>)[Jump to section]
```

### Labels and References

```typst
= Introduction <intro>

Some content here.

As discussed in @intro, we can reference sections.

// Page reference form
#ref(<intro>, form: "page")
```

### Images

```typst
#image("photo.jpg")

// With size constraints
#image("photo.jpg", width: 50%)
#image("diagram.svg", height: 5cm)

// Fit modes: "cover" (default), "contain", "stretch"
#image("photo.jpg", width: 100%, fit: "contain")

// Scaling hint for raster images
#image("pixel-art.png", scaling: "pixelated")

// Supported formats: png, jpg, gif, svg, pdf, webp
```

### Figures with Captions

```typst
#figure(
  image("glacier.jpg", width: 70%),
  caption: [A beautiful glacier in the mountains.],
  alt: "A glacier between two mountain peaks",
) <fig-glacier>

See @fig-glacier for the image.
```

### Footnotes

```typst
This needs clarification.#footnote[Here is the clarification.]
```

### Quotes

```typst
#quote(attribution: [Albert Einstein])[
  Imagination is more important than knowledge.
]

// Block quote
#quote(block: true)[
  A longer quotation that spans multiple lines...
]
```

---

## 4. Formatting & Styling

### Set Rules

Set rules apply default styles to elements throughout the document:

```typst
// Set font for entire document
#set text(font: "New Computer Modern", size: 11pt)

// Set page properties
#set page(margin: 2cm)

// Set paragraph justification
#set par(justify: true)

// Set heading numbering
#set heading(numbering: "1.1")
```

**Common settable functions:**
- `text` -- font, size, color, weight, language
- `page` -- size, margins, headers, footers, columns
- `par` -- justify, leading, first-line-indent, line numbering
- `heading` -- numbering, outlined, hanging-indent
- `list` / `enum` -- marker, indent, numbering
- `figure` -- placement, numbering, gap
- `table` -- columns, stroke, fill, align, inset
- `math.equation` -- numbering, supplement, alt

### Show Rules

Show rules redefine how elements appear:

**Text replacement:**
```typst
#show "Typst": smallcaps[Typst]
#show "badly": "great"
```

**Element styling (show-set rules):**
```typst
#show heading: set text(navy)
#show heading.where(level: 1): set text(size: 20pt)
#show heading.where(level: 2): set text(style: "italic")
```

**Transformational show rules:**
```typst
#show heading: it => block[
  #set text(red)
  Chapter: #it.body
]
```

### Selectors

```typst
// By element type
#show heading: ...

// By level/property (where selector)
#show heading.where(level: 1): ...

// By text content
#show "word": ...

// By regex pattern
#show regex("\\d+"): ...

// By label
#show <my-label>: ...

// Everything (rest of document)
#show: rest => ...
```

### Scoping

Styles apply until end of file or block:

```typst
#set text(red)
This is red.

#[
  #set text(blue)
  This is blue.
]

This is red again.
```

**Conditional set-if rules:**
```typst
#let task(body, critical: false) = {
  set text(red) if critical
  [- #body]
}

#task(critical: true)[Food today?]
#task(critical: false)[Work deadline]
```

### Composability Note

Set rules inside transformational show rules are **not overridable** from outside. Use separate show-set rules to maintain composability:

```typst
// Good - composable
#show heading: set text(navy)

// Less composable - set rule trapped inside function
#show heading: it => {
  set text(navy)  // Cannot be overridden externally
  it
}
```

---

## 5. Page Setup

### Page Sizes

```typst
// Predefined sizes
#set page(paper: "a4")
#set page(paper: "us-letter")

// Custom size
#set page(width: 15cm, height: 20cm)

// Landscape (flipped)
#set page(flipped: true)
```

**Available paper sizes:** a0-a10, iso-b0-b8, iso-c0-c8, us-letter, us-legal, us-executive, us-business-card

### Margins

```typst
// Uniform margins
#set page(margin: 2cm)

// Individual margins
#set page(margin: (
  top: 2.5cm,
  bottom: 2cm,
  left: 3cm,
  right: 2cm,
))

// Shorthand
#set page(margin: (x: 2cm, y: 2.5cm))

// For bound documents (alternating inside/outside)
#set page(margin: (inside: 3cm, outside: 2cm))

// Control binding side
#set page(binding: right)
```

Margin dictionary keys: `top`, `bottom`, `left`, `right`, `inside`, `outside`, `x`, `y`, `rest`.

### Headers and Footers

```typst
#set page(
  header: [
    _My Document_
    #h(1fr)
    Draft
  ],
  footer: [
    #h(1fr)
    #counter(page).display()
    #h(1fr)
  ],
)
```

**Conditional headers (skip first page):**
```typst
#set page(header: context {
  if counter(page).get().first() > 1 [
    Chapter Header
  ]
})
```

Header/footer/foreground/background content is automatically invisible to assistive technology.

### Page Numbering

```typst
// Simple numbering
#set page(numbering: "1")

// Roman numerals
#set page(numbering: "i")

// With decoration
#set page(numbering: "— 1 —")

// Page X of Y
#set page(numbering: "1 / 1")

// Alignment
#set page(number-align: right)

// Custom footer with "page X of total"
#set page(footer: context [
  #h(1fr)
  #counter(page).display("1 of 1", both: true)
])
```

**Reset page counter:**
```typst
#counter(page).update(1)
```

### Columns

```typst
#set page(columns: 2)

// Or use columns function with custom gutter
#columns(2, gutter: 1cm)[
  Content in columns...
  #colbreak()
  Second column...
]

// Float across columns to parent scope
#place(top + center, float: true, scope: "parent")[
  Full-width content
]
```

### Page Background and Foreground

```typst
#set page(
  background: rotate(24deg,
    text(18pt, fill: rgb("FFCBC4"))[*CONFIDENTIAL*]
  ),
  foreground: text(24pt)[Draft],
)
```

### One-off Page Changes

```typst
// Landscape page for wide content
#page(flipped: true)[
  Wide content here...
]
```

---

## 6. Text Functions

### The `text` Function

```typst
#text(font: "Arial", size: 14pt, fill: blue)[Styled text]

#text(weight: "bold")[Bold text]
#text(style: "italic")[Italic text]

#text(tracking: 0.1em)[S p a c e d]

// Text stroke (outline)
#text(stroke: 0.5pt + red)[Outlined text]
```

**Key parameters:**

| Parameter | Type | Default |
|-----------|------|---------|
| `font` | str / array | `"libertinus serif"` |
| `size` | length | `11pt` |
| `fill` | color / gradient / tiling | `luma(0%)` |
| `weight` | int / str | `"regular"` (100-900 or named) |
| `style` | str | `"normal"` ("italic", "oblique") |
| `tracking` | length | `0pt` |
| `spacing` | relative | `100% + 0pt` |
| `lang` | str | `"en"` (ISO 639) |
| `region` | str | `none` (ISO 3166) |
| `dir` | direction | `auto` (ltr, rtl) |
| `hyphenate` | bool | `auto` |
| `kerning` | bool | `true` |
| `ligatures` | bool | `true` |
| `number-type` | str | `auto` ("lining", "old-style") |
| `number-width` | str | `auto` ("proportional", "tabular") |
| `stroke` | stroke | `none` |
| `costs` | dictionary | hyphenation, runt, widow, orphan costs |

**Font weight names:** thin (100), extralight (200), light (300), regular (400), medium (500), semibold (600), bold (700), extrabold (800), black (900).

### Case Conversion

```typst
#upper[lowercase to uppercase]
#lower[UPPERCASE TO LOWERCASE]
#smallcaps[Small Capitals]
#smallcaps(all: true)[ALL SMALL CAPS]  // converts uppercase too
```

### Text Decorations

```typst
#underline[Underlined text]
#strike[Strikethrough text]
#overline[Overlined text]

// Customized
#underline(stroke: 2pt + red, offset: 2pt)[Custom underline]
#strike(stroke: 1.5pt + red)[Stricken through]
```

All decoration functions accept: `stroke`, `offset`, `extent`, `evade` (bool), `background` (bool).

### Subscript and Superscript

```typst
H#sub[2]O is water.
E = mc#super[2]

// Typographic vs synthetic
N#sub(typographic: true)[1]   // Uses font features
N#sub(typographic: false)[1]  // Simulated with size/offset
```

### Raw Text and Code

```typst
// Inline code
`let x = 5`

// Code block with syntax highlighting
```python
def hello():
    print("Hello!")
```

// Customized raw display
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
)

// Custom syntaxes and themes
#set raw(syntaxes: "custom.sublime-syntax")
#set raw(theme: "halcyon.tmTheme")
#set raw(tab-size: 4)
```

**`raw` parameters:** `text`, `block` (bool), `lang` (str), `align`, `syntaxes`, `theme`, `tab-size` (int, default 2).

**Sub-element `raw.line`:** access individual lines with `number`, `count`, `text`, `body`.

### Highlighting

```typst
#highlight[Important text]
#highlight(fill: yellow)[Yellow highlight]
#highlight(stroke: fuchsia)[Stroked highlighting]
#highlight(radius: 5pt, extent: 2pt)[Rounded highlight]
```

### Smart Quotes

```typst
"Double quotes" and 'single quotes'

// Language-aware
#set text(lang: "de")
"German quotes" // Uses „..."

#set text(lang: "cs")
"Czech quotes" // Uses „..."
```

### Line Breaks

```typst
#linebreak()   // Force line break
Text \ break   // Backslash also works

// Justified line break (fills line before breaking)
#linebreak(justify: true)
```

### Lorem Ipsum

```typst
#lorem(50)  // Generate 50 words of placeholder text
```

---

## 7. Mathematics

### Inline vs Display Math

```typst
// Inline math (no spaces inside $)
The formula $x^2 + y^2 = r^2$ is inline.

// Display math (spaces inside $)
The equation is:
$ x = (-b plus.minus sqrt(b^2 - 4 a c)) / (2 a) $
```

### Basic Syntax

```typst
$ x^2 $           // Superscript
$ x_1 $           // Subscript
$ x_1^2 $         // Both
$ sqrt(x) $       // Square root
$ root(3, x) $    // Nth root
$ (a + b) / c $   // Fraction (auto-scales)
```

### Variables and Text in Math

```typst
// Single letters are variables; multi-letter are functions
$ A = pi r^2 $
$ "area" = pi dot "radius"^2 $

// Calligraphic sets
$ cal(A) := { x in RR | x "is natural" } $

// Interpolate code variables
#let x = 5
$ #x < 17 $
```

### Greek Letters and Symbols

```typst
$ alpha, beta, gamma, delta, epsilon $
$ Gamma, Delta, Theta, Lambda, Pi $
$ pi approx 3.14159 $
$ forall x in RR: x^2 >= 0 $
$ sum_(i=1)^n i = (n(n+1))/2 $
$ integral_0^infinity e^(-x) dif x $
```

### Fractions

```typst
$ frac(a, b) $        // Explicit fraction
$ (a + b) / c $       // Shorthand (parentheses removed)
$ ((a + b)) / c $     // Keep parentheses with double nesting

// Fraction styles
$ frac(x, y, style: "vertical") $     // Standard stacked
$ frac(x, y, style: "skewed") $       // Skewed inline
$ frac(x, y, style: "horizontal") $   // Horizontal with slash

// Set skewed for inline equations only
#show math.equation.where(block: false): set math.frac(style: "horizontal")
```

### Matrices and Vectors

```typst
// Matrix
$ mat(
  1, 2, 3;
  4, 5, 6;
  7, 8, 9;
) $

// Vector
$ vec(x, y, z) $

// With delimiters
$ mat(delim: "[", 1, 2; 3, 4) $
$ vec(delim: "[", 1, 2) $

// Augmented matrix
$ mat(1, 0, 1; 0, 1, 2; augment: #2) $
$ mat(0, 0, 0; 1, 1, 1; augment: #(hline: 1, stroke: 2pt + green)) $

// Custom gaps
#set math.mat(row-gap: 1em, column-gap: 1em)

// Spread data into matrix
#let data = ((1, 2, 3), (4, 5, 6))
$ v := mat(..#data) $
```

### Alignment in Multi-line Equations

```typst
// Basic alignment with &
$ x &= 2 + 3 \
  &= 5 $

// Multiple alignment columns (alternating right/left)
$ (3x + y) / 7 &= 9 && "given" \
  3x + y &= 63 & "multiply by 7" \
  3x &= 63 - y && "subtract y" \
  x &= 21 - y/3 & "divide by 3" $
```

### Cases

```typst
$ f(x) = cases(
  0 &"if" x < 0,
  1 &"if" x >= 0,
) $

// Reversed (brace on right)
#set math.cases(reverse: true)
$ cases(1, 2) = x $
```

### Binomials

```typst
$ binom(n, k) = frac(n!, k!(n-k)!) $
$ binom(n, k_1, k_2, k_3, ..., k_m) $
```

### Limits and Big Operators

```typst
$ lim_(x -> infinity) 1/x = 0 $
$ sum_(i=0)^n a_i $
$ product_(i=1)^n i = n! $
```

### Attachments (Sub/Superscript Positions)

```typst
// Six attachment positions
$ attach(Pi, t: alpha, b: beta,
  tl: 1, tr: 2, bl: 3, br: 4) $

// Force scripts (side) vs limits (above/below)
$ scripts(sum)_1^2 != sum_1^2 $
$ limits(A)_1^2 != A_1^2 $
```

### Accents

```typst
$ hat(a) $          // circumflex
$ tilde(a) $        // tilde
$ dot(a) $          // single dot
$ dot.double(a) $   // double dot (diaeresis)
$ arrow(a) $        // vector arrow
$ macron(a) $       // macron/bar

// Multi-letter base
$ arrow(A B C) $

// Dotless i/j (default behavior)
$ hat(i) $                      // dot removed automatically
$ hat(dotless: #false, i) $     // keep the dot
```

### Cancel (Strikethrough in Math)

```typst
$ (a dot b dot cancel(x)) / cancel(x) $

// Cross out
$ cancel(Pi, cross: #true) $

// Custom angle and stroke
$ cancel(Pi, angle: #45deg) $
$ cancel(sum x, stroke: #(paint: red, thickness: 1.5pt, dash: "dashed")) $
```

### Delimiters and Scaling

```typst
// Auto-scaling delimiters
$ lr(]sum_(x=1)^n], size: #50%) x $

// Absolute value, norm, floor, ceiling, round
$ abs(x/2) $  $ norm(x/2) $  $ floor(x/2) $  $ ceil(x/2) $  $ round(x/2) $

// Mid delimiter (scales to surrounding lr group)
$ { x mid(|) sum_(i=1)^n w_i|f_i (x)| < 1 } $

// Escape delimiters to prevent auto-scaling
$ \( a / b \) $
```

### Stretch

```typst
$ H stretch(=)^"define" U + p V $
$ f : X stretch(->>, size: #150%)_"surjective" Y $
```

### Math Variants (Typefaces)

```typst
$ sans(A B C) $     // Sans-serif
$ frak(P) $         // Fraktur
$ mono(x + y) $     // Monospace
$ bb(N) = NN $      // Blackboard bold
$ cal(P) $          // Calligraphic
$ scr(L) $          // Script (roundhand)
$ serif(A B C) $    // Serif (default)
```

### Sizes

```typst
// Force specific size
$ display(sum_i x_i/2) $     // Full display size
$ inline(sum_i x_i/2) $      // Inline size
$ script(sum_i x_i/2) $      // Script size
$ sscript(sum_i x_i/2) $     // Sub-script size
```

### Text Operators

```typst
$ tan x = (sin x)/(cos x) $

// Custom operator
$ op("custom", limits: #true)_(n->oo) n $
```

**Predefined operators:** `arccos`, `arcsin`, `arctan`, `arg`, `cos`, `cosh`, `cot`, `coth`, `csc`, `csch`, `ctg`, `deg`, `det`, `dim`, `exp`, `gcd`, `lcm`, `hom`, `id`, `im`, `inf`, `ker`, `lg`, `lim`, `liminf`, `limsup`, `ln`, `log`, `max`, `min`, `mod`, `Pr`, `sec`, `sech`, `sin`, `sinc`, `sinh`, `sup`, `tan`, `tanh`, `tg`, `tr`.

### Primes

```typst
// Apostrophes auto-attach as primes
$ a' $
$ a'' $
$ a'''_b $
```

### Math Class

Force specific spacing behavior:
```typst
#let loves = math.class("relation", sym.suit.heart)
$ x loves y $
```

Classes: `"normal"`, `"punctuation"`, `"opening"`, `"closing"`, `"fence"`, `"large"`, `"relation"`, `"unary"`, `"binary"`, `"vary"`.

### Equation Numbering

```typst
#set math.equation(numbering: "(1)", supplement: [Eq.])

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

With @ratio, we get:
$ F_n = floor(1 / sqrt(5) phi.alt^n) $
```

### Math Accessibility

```typst
#math.equation(
  alt: "d S equals delta q divided by T",
  block: true,
  $ dif S = (delta q) / T $,
)
```

### Math Fonts

```typst
#show math.equation: set text(font: "Fira Math")
```

### Math Functions Reference

| Function | Description |
|----------|-------------|
| `frac(a, b)` | Fraction (styles: vertical, skewed, horizontal) |
| `sqrt(x)` | Square root |
| `root(n, x)` | Nth root |
| `vec(...)` | Column vector |
| `mat(...; ...)` | Matrix |
| `cases(...)` | Case distinction |
| `binom(n, k)` | Binomial coefficient |
| `abs(x)` | Absolute value |
| `norm(x)` | Norm |
| `floor(x)` | Floor |
| `ceil(x)` | Ceiling |
| `round(x)` | Rounding |
| `cancel(x)` | Strikethrough |
| `accent(base, accent)` | Accent mark |
| `attach(base, t:, b:, ...)` | Attachments (6 positions) |
| `scripts(x)` | Force script positioning |
| `limits(x)` | Force limits positioning |
| `op("text")` | Text operator |
| `lr(content)` | Scaled delimiters |
| `mid(delim)` | Scaled mid-delimiter |
| `stretch(glyph)` | Stretch glyph |
| `display(x)` | Force display size |
| `inline(x)` | Force inline size |
| `class(class, body)` | Force math class |

---

## 8. Tables

### Basic Table

```typst
#table(
  columns: 3,
  [*Header 1*], [*Header 2*], [*Header 3*],
  [Cell 1], [Cell 2], [Cell 3],
  [Cell 4], [Cell 5], [Cell 6],
)
```

### Semantic Header

```typst
#table(
  columns: 2,
  table.header(
    [*Name*], [*Value*],
  ),
  [Alpha], [1],
  [Beta], [2],
)
```

Headers repeat on page breaks by default. Disable with `table.header(repeat: false)`. Multiple headers with levels are supported: `table.header(level: 2)`.

**Show rule for header styling:**
```typst
#show table.cell.where(y: 0): strong
```

### Column Sizing

```typst
// Auto-sized columns
#table(columns: (auto, auto, auto), ...)

// Fixed widths
#table(columns: (5cm, 3cm, 4cm), ...)

// Fractional (distribute remaining space)
#table(columns: (1fr, 2fr, 1fr), ...)

// Mixed
#table(columns: (auto, 1fr, 2cm), ...)

// Percentage
#table(columns: (30%, 70%), ...)

// Integer shorthand (N auto columns)
#table(columns: 3, ...)
```

### Styling and Colors

```typst
// Zebra stripes (by row)
#set table(
  fill: (_, y) => if calc.odd(y) { luma(240) },
)

// Column-based fill (cycles)
#set table(fill: (rgb("EAF2F5"), none))

// Individual cell styling
#table(
  columns: 2,
  table.cell(fill: red)[Red cell], [Normal],
  [Normal], table.cell(fill: green)[Green cell],
)
```

### Strokes and Borders

```typst
// Custom stroke
#table(stroke: 0.5pt + gray, ...)

// No strokes
#table(stroke: none, ...)

// Horizontal lines only
#table(stroke: (x: none, y: 0.5pt), ...)

// Function-based stroke
#set table(stroke: (_, y) => if y > 0 { (top: 0.8pt) })

// Custom lines
#table(
  columns: 2,
  [A], [B],
  table.hline(stroke: 2pt),
  [C], [D],
)

// Vertical line
#table(
  columns: 3,
  table.vline(x: 1, start: 1),
  [A], [B], [C],
  [D], [E], [F],
)
```

### Cell Spanning

```typst
#table(
  columns: 3,
  table.cell(colspan: 2)[Spans 2 columns], [Single],
  table.cell(rowspan: 2)[Spans 2 rows], [A], [B],
  [C], [D],
)
```

### Alignment

```typst
// All cells
#table(align: center + horizon, ...)

// Per column (array cycles)
#table(
  columns: 3,
  align: (left, center, right),
  ...
)

// Function-based
#table(
  align: (x, y) => if x == 0 { right } else { left },
  ...
)
```

### Multi-page Tables

```typst
#show figure: set block(breakable: true)

#figure(
  table(
    columns: 2,
    table.header([*Col 1*], [*Col 2*]),
    table.footer([_End_], [_End_]),
    ..range(50).map(i => ([Row #i], [Data])).flatten()
  ),
  caption: [A long table],
)
```

### Import Data to Table

```typst
#let data = csv("data.csv")
#table(
  columns: data.first().len(),
  ..data.flatten()
)
```

### Table Rotation

```typst
// Rotate the table
#rotate(-90deg, reflow: true, table(...))

// Or use landscape page
#page(flipped: true)[ #table(...) ]
```

### Grid vs Table

Use `grid` for layout (no semantic table meaning, no default strokes/inset):

```typst
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [Left content],
  [Right content],
)
```

Both share the same sub-elements: `cell`, `hline`, `vline`, `header`, `footer`.

---

## 9. Layout

### Alignment

```typst
#align(center)[Centered content]
#align(right)[Right-aligned]
#align(left + bottom)[Bottom-left]

// Alignment values: left, center, right, start, end, top, horizon, bottom
// Combine with +: center + horizon
```

For same-line alignment, use `#h(1fr)` instead of `align`:
```typst
Start #h(1fr) End
```

### Horizontal and Vertical Spacing

```typst
Word #h(1cm) Word    // Horizontal space (fixed)
Word #h(1fr) Word    // Flexible space (push apart)
First #h(2fr) Second #h(1fr) Third  // 2:1 ratio

#v(2em)              // Vertical space

// Weak spacing (collapses at edges and with other weak spacing)
#h(1cm, weak: true)
#v(1em, weak: true)
```

Math spacing constants: `thin` (1/6 em), `med` (2/9 em), `thick` (5/18 em), `quad` (1 em), `wide` (2 em).

### Padding

```typst
#pad(1em)[Padded content]
#pad(left: 2em, top: 1em)[Selective padding]
#pad(x: 1em, y: 0.5em)[X and Y padding]
```

### Box (Inline Container)

```typst
#box(width: 5cm, height: 2cm, fill: aqua)[
  Content in a box
]

#box(stroke: 1pt + black, inset: 0.5em, radius: 4pt)[Bordered box]

// Fractional width fills remaining line space
#box(width: 1fr, line(length: 100%))

// Baseline shift
#box(baseline: 40%, image("icon.png", width: 2cm))

// Clip overflowing content
#box(width: 50pt, height: 50pt, clip: true)[...]
```

### Block (Block-level Container)

```typst
#block(width: 100%, fill: luma(230), inset: 1em, radius: 4pt)[
  Block content
]

#block(spacing: 2em)[Spaced block]

// Prevent page breaking
#block(breakable: false)[Content that stays together]

// Sticky block (stays with next element, like headings)
#block(sticky: true)[Must stay with what follows]

// Clip overflowing content
#block(width: 50pt, height: 50pt, clip: true)[...]
```

**Key parameters:** `width`, `height`, `breakable`, `fill`, `stroke`, `radius`, `inset`, `outset`, `spacing`, `above`, `below`, `clip`, `sticky`.

### Stack

```typst
// Vertical stack (default direction: ttb)
#stack(
  spacing: 1em,
  [First],
  [Second],
  [Third],
)

// Horizontal stack
#stack(
  dir: ltr,
  spacing: 1em,
  [A], [B], [C],
)
```

Directions: `ltr`, `rtl`, `ttb`, `btt`.

### Grid Layout

```typst
#grid(
  columns: (1fr, 2fr),
  rows: (auto, auto),
  gutter: 1em,
  [Top Left], [Top Right],
  [Bottom Left], [Bottom Right],
)
```

**Grid parameters:** Same as `table` (`columns`, `rows`, `gutter`, `column-gutter`, `row-gutter`, `inset`, `align`, `fill`, `stroke`) but with no default strokes.

### Columns

```typst
#columns(2)[
  First column content...
  #colbreak()
  Second column content...
]

#columns(3, gutter: 2em)[
  Three columns with custom gutter...
]
```

### Place (Overlay and Floating)

```typst
// Overlay (does not consume space)
#place(top + right)[Top right corner]

#place(
  dx: 2cm,
  dy: 3cm,
)[Offset placement]

// Floating placement (consumes space, auto-positioned)
#place(
  float: true,
  scope: "column",   // or "parent" for full-width
  auto,
)[Floating element]

// Force pending floats to render
#place.flush()
```

### Transformations

```typst
#rotate(45deg)[Rotated 45 degrees]
#rotate(30deg, origin: top + left)[Custom origin]

#scale(x: 150%, y: 100%)[Scaled horizontally]
#scale(x: -100%)[Mirrored]

#move(dx: 1cm, dy: -0.5cm)[Moved content]

#skew(ax: -12deg)[Fake italic text]

// Use reflow: true to adjust bounding box
#rotate(90deg, reflow: true)[Reflowed]
#scale(x: 20%, y: 40%, reflow: true)[Reflowed]
```

### Hide (Invisible but Takes Space)

```typst
#hide[This takes space but is invisible]
```

### Repeat

```typst
Sign here: #box(width: 1fr, repeat[.])
```

Content is automatically marked as artifact (hidden from assistive technology). Must have bounded available space.

### Measure

```typst
#context {
  let size = measure[Hello]
  [Width: #size.width, Height: #size.height]
}

// With constrained width
#context {
  let size = measure(width: 200pt)[Hello World this is long text]
  [Height at 200pt width: #size.height]
}
```

### Page Breaks

```typst
#pagebreak()

// Weak page break (no effect if already at page start)
#pagebreak(weak: true)
```

---

## 10. Visualization

### Images

```typst
#image("photo.jpg")
#image("diagram.svg", width: 80%)
#image("icon.png", height: 2cm, fit: "contain")
```

**Parameters:**

| Parameter | Type | Default |
|-----------|------|---------|
| `source` | str / bytes | required |
| `format` | auto / str | `auto` |
| `width` | auto / relative | `auto` |
| `height` | auto / relative | `auto` |
| `alt` | str | `none` |
| `fit` | str | `"cover"` |
| `scaling` | auto / str | `auto` |
| `icc` | auto / str / bytes | `auto` |

**Formats:** `"png"`, `"jpg"`, `"gif"`, `"svg"`, `"pdf"`, `"webp"`.

**Fit modes:** `"cover"` (crop to fill), `"contain"` (fit within), `"stretch"` (distort to fill).

**Scaling hints:** `"smooth"` (bilinear), `"pixelated"` (nearest neighbor).

**Raw pixel images:**
```typst
#image(
  bytes(range(16).map(x => x * 16)),
  format: (encoding: "luma8", width: 4, height: 4),
  width: 2cm,
)
```

### Shapes

```typst
// Rectangle
#rect(width: 3cm, height: 2cm, fill: blue)
#rect(width: 2cm, height: 2cm, radius: 5pt)  // Rounded

// Square
#square(size: 2cm, fill: red)

// Circle
#circle(radius: 1cm, fill: green)

// Ellipse
#ellipse(width: 3cm, height: 2cm, fill: purple)
```

All shapes accept: `fill`, `stroke`, `inset`, `outset`, and optional `body` content.

### Lines

```typst
#line(length: 5cm)
#line(start: (0pt, 0pt), end: (3cm, 1cm))
#line(length: 100%, stroke: 2pt + red)

// Stroke styles
#line(stroke: (paint: blue, thickness: 4pt, cap: "round"))
#line(stroke: (paint: blue, thickness: 1pt, dash: "dashed"))
```

### Polygon

```typst
#polygon(
  fill: orange,
  (0pt, 0pt),
  (2cm, 0pt),
  (2.5cm, 1cm),
  (1cm, 2cm),
)

// Regular polygon
#polygon.regular(fill: blue, size: 30pt, vertices: 5)
```

### Curve (Bezier Paths) -- replaces deprecated `path`

```typst
#import "@preview/cetz:0.3.0"
// Or use the built-in curve function
#curve(
  fill: purple,
  closed: true,
  (0pt, 0pt),
  (1cm, 2cm),
  (2cm, 0pt),
)
```

Note: `path` is deprecated since Typst 0.13. Use `curve` instead.

### Colors

```typst
// Named colors
#text(fill: red)[Red]
#text(fill: blue)[Blue]

// RGB
#text(fill: rgb(255, 128, 0))[Orange]
#text(fill: rgb("#ff8000"))[Orange hex]

// CMYK
#text(fill: cmyk(0%, 50%, 100%, 0%))[CMYK Orange]

// Grayscale
#text(fill: luma(128))[Gray]
#text(fill: luma(50%))[Gray percentage]

// Other color spaces
#text(fill: oklab(50%, 0.1, -0.1))[Oklab]
#text(fill: oklch(50%, 0.15, 250deg))[Oklch]
#text(fill: hsl(120deg, 50%, 50%))[HSL green]
#text(fill: hsv(120deg, 50%, 50%))[HSV green]
#text(fill: linear-rgb(50%, 0%, 0%))[Linear RGB]
```

**Predefined colors:** black, gray, silver, white, navy, blue, aqua, teal, eastern, purple, fuchsia, maroon, red, orange, yellow, olive, green, lime.

**Color modifications:**
```typst
#text(fill: blue.lighten(50%))[Light blue]
#text(fill: red.darken(30%))[Dark red]
#text(fill: green.saturate(50%))[Saturated]
#text(fill: red.negate())[Complementary]
#text(fill: blue.rotate(120deg))[Hue rotated]
#text(fill: red.transparentize(50%))[Semi-transparent]
#text(fill: color.mix(red, blue))[Mixed]
```

**Color maps:** `color.map.turbo`, `color.map.viridis`, `color.map.inferno`, `color.map.magma`, `color.map.plasma`, `color.map.cividis`, `color.map.rainbow`, `color.map.spectral`, etc.

### Gradients

```typst
// Linear gradient
#rect(width: 5cm, height: 2cm,
  fill: gradient.linear(red, blue))

// Radial gradient
#circle(radius: 2cm,
  fill: gradient.radial(yellow, orange, red))

// Conic gradient
#circle(radius: 2cm,
  fill: gradient.conic(..color.map.rainbow))

// Sharp (stepped) gradient
#rect(fill: gradient.linear(..color.map.viridis).sharp(10))

// Repeated gradient
#rect(fill: gradient.linear(red, blue).repeat(4, mirror: true))

// Text with gradient
#set text(fill: gradient.linear(..color.map.rainbow))
```

### Stroke

```typst
// Shorthand
#line(stroke: 3pt + red)

// Full stroke object
#rect(stroke: (
  paint: blue,
  thickness: 2pt,
  dash: "dashed",
  cap: "round",
  join: "round",
))
```

**Cap styles:** `"butt"` (default), `"round"`, `"square"`.

**Join styles:** `"miter"` (default), `"round"`, `"bevel"`.

**Dash presets:** `"solid"`, `"dotted"`, `"densely-dotted"`, `"loosely-dotted"`, `"dashed"`, `"densely-dashed"`, `"loosely-dashed"`, `"dash-dotted"`, `"densely-dash-dotted"`, `"loosely-dash-dotted"`.

**Custom dash:**
```typst
#line(stroke: (dash: (10pt, 5pt, "dot", 5pt)))
#line(stroke: (dash: (array: (10pt, 5pt), phase: 10pt)))
```

### Tiling (Repeating Patterns) -- replaces deprecated `pattern`

```typst
#let pat = tiling(size: (30pt, 30pt))[
  #place(line(start: (0%, 0%), end: (100%, 100%)))
  #place(line(start: (0%, 100%), end: (100%, 0%)))
]
#rect(fill: pat, width: 100%, height: 60pt)

// With spacing between tiles
#let pat = tiling(size: (30pt, 30pt), spacing: (10pt, 10pt))[
  #square(size: 30pt, fill: blue)
]
```

Note: `pattern` is a deprecated alias for `tiling` since Typst 0.13.

---

## 11. Scripting

### Variables

```typst
#let name = "Typst"
#let count = 42
#let items = (1, 2, 3)

The name is #name and count is #count.
```

### Expressions

Code is embedded in markup with `#`. The expression continues until normal markup can resume. Use `;` to forcibly end. Parentheses needed for binary operators: `#(1 + 2)`.

### Blocks

**Code blocks** `{ ... }` -- multiple statements; output values are joined:
```typst
#{
  let a = [from]
  let b = [*world*]
  [hello ]
  a + [ the ] + b
}
```

**Content blocks** `[ ... ]` -- contain markup, return `content`:
```typst
#let greeting = [Hello, *World*!]
```

### Functions

```typst
// Basic function
#let greet(name) = [Hello, #name!]
#greet("World")

// With default parameter
#let greet(name, greeting: "Hello") = [#greeting, #name!]
#greet("World", greeting: "Hi")

// Content parameter (trailing content)
#let important(body) = [*#body*]
#important[This is important]

// Anonymous function (closure)
#let double = x => x * 2
#((x, y) => x + y)(1, 2)
```

### Conditionals

```typst
#if 1 < 2 [
  This is shown
] else if x == 0 [
  Zero
] else [
  This is not shown.
]
```

### Loops

**For loops** -- iterate over arrays, dictionaries, strings, bytes:
```typst
#for i in range(5) [
  Item #i
]

#for letter in "ABC" [
  Letter: #letter
]

#for (key, value) in (a: 1, b: 2) [
  #key = #value
]
```

**While loops:**
```typst
#{
  let n = 0
  while n < 5 {
    n += 1
    [Item #n ]
  }
}
```

**Loop control:**
```typst
#for i in range(10) {
  if i == 5 { break }
  if calc.odd(i) { continue }
  [#i ]
}
```

### Destructuring

```typst
#let (a, b) = (1, 2)
#let (first, .., last) = (1, 2, 3, 4, 5)
#let (x, _, z) = (1, 2, 3)  // Ignore middle

// Dictionary destructuring
#let (name,) = (name: "Alice", age: 30)

// In function arguments
#left.zip(right).map(((a, b)) => a + b)
```

### Arrays

```typst
#let arr = (1, 2, 3)
#let empty = ()
#let single = (1,)  // Trailing comma required

#arr.at(0)         // 1 (negative indices wrap)
#arr.len()         // 3
#arr.first()       // 1
#arr.last()        // 3
#arr.first(default: 0)  // with fallback
#arr.slice(1, 3)   // (2, 3)
#arr.contains(2)   // true
#arr.map(x => x * 2)        // (2, 4, 6)
#arr.filter(x => x > 1)     // (2, 3)
#arr.fold(0, (acc, x) => acc + x)  // 6
#arr.join(", ")    // "1, 2, 3"
#arr.rev()         // (3, 2, 1)
#arr.sorted()      // sorted ascending
#arr.sorted(by: (a, b) => b - a)  // custom comparator
#arr.dedup()       // remove duplicates
#arr.enumerate()   // ((0, 1), (1, 2), (2, 3))
#arr.zip((4, 5, 6))  // ((1, 4), (2, 5), (3, 6))
#arr.chunks(2)     // ((1, 2), (3,))
#arr.windows(2)    // ((1, 2), (2, 3))
#arr.flatten()     // flatten nested arrays
#arr.sum()         // 6
#arr.product()     // 6
#arr.any(x => x > 2)  // true
#arr.all(x => x > 0)  // true
#arr.intersperse(0)    // (1, 0, 2, 0, 3)
#arr.split(2)      // ((1,), (3,))
```

**Mutating methods:** `push(value)`, `pop()`, `insert(index, value)`, `remove(index)`.

**Static:** `array.range(start, end, step)`.

### Dictionaries

```typst
#let dict = (name: "Alice", age: 30)
#let empty = (:)

#dict.name         // "Alice"
#dict.at("age")    // 30
#dict.at("missing", default: 0)  // 0
#dict.keys()       // ("name", "age")
#dict.values()     // ("Alice", 30)
#dict.pairs()      // (("name", "Alice"), ("age", 30))
#dict.len()        // 2

// Supports `in`, `+` merging, `..spread`
#if "name" in dict [Has name]
```

**Mutating methods:** `insert(key, value)`, `remove(key)`.

### Fields and Methods

```typst
// Content fields
#let it = [= Heading]
#it.body      // "Heading"
#it.depth     // 1
#it.fields()  // dictionary of all fields

// Method call equivalence
#"abc".len()  // same as str.len("abc")
```

### Modules and Imports

```typst
// Include (insert content)
#include "chapter1.typ"

// Import entire file
#import "utils.typ"
#utils.my-function()

// Import specific items
#import "utils.typ": my-function, my-variable

// Import all
#import "utils.typ": *

// Import with rename
#import "utils.typ" as u
#import "utils.typ": a as one

// Check membership
#if "table" in std [std has table]
```

### Packages

```typst
// Import from Typst Universe
#import "@preview/package-name:0.1.0": function-name

// Example
#import "@preview/cetz:0.3.0": canvas, draw
```

Format: `@namespace/name:version`. The `preview` namespace contains community packages.

### Operators (by precedence, highest first)

| Precedence | Operator | Description |
|------------|----------|-------------|
| 7 | `-x`, `+x` | Negation, no-op |
| 6 | `*`, `/` | Multiplication, division |
| 5 | `+`, `-` | Addition, subtraction |
| 4 | `==`, `!=`, `<`, `>`, `<=`, `>=` | Comparison |
| 4 | `in`, `not in` | Membership |
| 3 | `not` | Logical NOT |
| 3 | `and` | Short-circuit AND |
| 2 | `or` | Short-circuit OR |
| 1 | `=`, `+=`, `-=`, `*=`, `/=` | Assignment |

---

## 12. Context & Introspection

### Context Keyword

The `context` keyword enables expressions to react to their position in the document:

```typst
#context {
  [Current page: #counter(page).get().first()]
}
```

Context expressions are **opaque** -- their results cannot be directly accessed in surrounding code because contextual data varies by location.

### Style Context

Access style properties set via set rules:

```typst
#set text(lang: "de")
#context text.lang  // "de"
```

A context expression stored in a variable reacts to the environment where placed:
```typst
#let value = context text.lang
#value  // "en"

#set text(lang: "de")
#value  // "de"
```

### Location Context

Functions that use location context: `counter.get()`, `counter.at()`, `here()`, `locate()`, `query()`.

```typst
#set heading(numbering: "1.")

= Introduction
#context counter(heading).get()  // (1,)

= Background
#context counter(heading).get()  // (2,)
```

**Time-travel with labels:**
```typst
= Introduction <intro>
= Background <back>

#context [
  Current: #counter(heading).get() \
  At intro: #counter(heading).at(<intro>)
]
```

**Physical position:**
```typst
#context locate(<back>).position()  // (page: 1, x: ..., y: ...)
```

### Nested Contexts

Inner context blocks access the innermost context:
```typst
#set text(lang: "de")
#context [
  #set text(lang: "fr")
  #text.lang \       // "de" (outer context)
  #context text.lang  // "fr" (inner context)
]
```

### Counters

```typst
// Built-in counters
#set heading(numbering: "1.")
#context counter(heading).get()

// Page counter
#context counter(page).get().first()

// Custom counter
#let my-counter = counter("my-counter")
#my-counter.step()
#context my-counter.display()

// Update counter
#counter(page).update(1)
#counter(page).update(n => n + 5)

// Display with format
#context counter(page).display("1 of 1", both: true)

// Get final value
#context counter(heading).final()
```

**Counter methods:** `get()`, `at(selector)`, `final()`, `display(numbering, both)`, `step(level)`, `update(value)`.

### State

```typst
#let total = state("total", 0)

#total.update(x => x + 10)
#total.update(x => x + 20)

#context [Total: #total.get()]  // 30

// Get at specific location
#context total.at(<some-label>)

// Get final value
#context total.final()
```

State updates execute in layout order, not evaluation order.

### Query

Find elements in the document:

```typst
#context {
  let headings = query(heading)
  [Found #headings.len() headings]
}

// Query with selector
#context {
  let h1s = query(heading.where(level: 1))
  for h in h1s [
    - #h.body
  ]
}
```

**CLI query:** `typst query file.typ "<label>" --field value --one`

### Locate

Get position of labeled elements:

```typst
= Introduction <intro>

#context {
  let pos = locate(<intro>).position()
  [Intro is on page #pos.page]
}
```

Selector must match exactly one element.

### Here

```typst
#context here().position()  // current location
```

### Metadata

Attach invisible data for querying:

```typst
#metadata("important") <marker>

#context {
  let m = query(<marker>)
  [Found: #m.first().value]
}
```

### Compiler Iterations

Typst compiles documents multiple times (up to **5 iterations**) to resolve contextual interactions. If it cannot converge: "layout did not converge within 5 attempts."

---

## 13. Data Loading

### CSV

```typst
#let data = csv("data.csv")
#table(
  columns: data.first().len(),
  ..data.flatten()
)

// With options
#let data = csv("data.csv", delimiter: ";")

// Dictionary rows (using first row as headers)
#let data = csv("data.csv", row-type: dictionary)
```

### JSON

```typst
#let config = json("config.json")
#config.title

// Encode to JSON string
#json.encode((name: "Alice", age: 30), pretty: true)
```

### YAML

```typst
#let data = yaml("data.yaml")
#data.name

// Encode
#yaml.encode((name: "Alice"))
```

### TOML

```typst
#let config = toml("config.toml")
#config.section.key

// Encode
#toml.encode((section: (key: "value")))
```

### XML

```typst
#let doc = xml("data.xml")
// Elements become dicts with `tag`, `attrs`, `children` keys
// Text nodes are strings
```

### CBOR

```typst
#let data = cbor("data.cbor")

// Encode
#cbor.encode((name: "Alice"))  // returns bytes
```

### Plain Text

```typst
#let content = read("file.txt")           // UTF-8 string
#let raw-data = read("file.bin", encoding: none)  // raw bytes
```

---

## 14. Foundations (Data Types)

### Basic Types

| Type | Description | Example |
|------|-------------|---------|
| `int` | 64-bit signed integer | `42`, `-5`, `0xff`, `0b1001`, `0o77` |
| `float` | 64-bit floating-point | `3.14`, `1e-5`, `float.inf`, `float.nan` |
| `bool` | Boolean | `true`, `false` |
| `str` | String | `"hello"` |
| `none` | Absence of value | `none` |
| `auto` | Automatic value | `auto` |
| `content` | Document content | `[*Hello*]` |
| `decimal` | Exact decimal number | -- |

### Length Units

```typst
12pt      // Points
1cm       // Centimeters
10mm      // Millimeters
1in       // Inches
1em       // Font size relative
```

### Angle Units

```typst
90deg     // Degrees
1.57rad   // Radians
```

### Ratio and Fraction

```typst
50%       // Percentage (ratio)
1fr       // Fractional unit
```

### Integer Methods

```typst
#let n = 42
#n.signum()       // 1 (-1, 0, or 1)

// Bitwise operations
#n.bit-not()
#n.bit-and(0xff)
#n.bit-or(0x0f)
#n.bit-xor(0xff)
#n.bit-lshift(4)
#n.bit-rshift(4)

// Byte conversion
#n.to-bytes()     // bytes (little-endian, 8 bytes default)
#int.from-bytes(bytes((42, 0, 0, 0, 0, 0, 0, 0)))
```

### Float Methods

```typst
#let f = 3.14
#f.is-nan()       // false
#f.is-infinite()  // false
#f.signum()       // 1.0

// Special values
#float.inf        // Infinity
#float.nan        // Not a Number

// Byte conversion
#f.to-bytes()
#float.from-bytes(bytes)
```

### String Methods

```typst
#let s = "hello world"
#s.len()           // 11
#s.first()         // "h"
#s.last()          // "d"
#s.at(0)           // "h" (negative wraps)
#s.slice(0, 5)     // "hello"
#s.contains("world")  // true
#s.starts-with("he")  // true
#s.ends-with("ld")    // true
#s.find("wor")     // "wor"
#s.position("wor") // 6
#s.replace("world", "there")  // "hello there"
#s.split(" ")      // ("hello", "world")
#s.trim()          // trim whitespace
#s.rev()           // "dlrow olleh"
#s.clusters()      // array of grapheme clusters
#s.codepoints()    // array of Unicode codepoints

// Pattern matching (accepts str or regex)
#s.match(regex("\\w+"))   // dict with start, end, text, captures
#s.matches(regex("\\w+")) // array of match dicts

// Unicode normalization
#s.normalize("nfc")  // "nfc", "nfkc", "nfd", "nfkd"

// Unicode conversion
#str.to-unicode("A")    // 65
#str.from-unicode(65)   // "A"
```

### Arrays

```typst
#let arr = (1, 2, 3)
#let empty = ()
#let single = (1,)  // Trailing comma required for single element
```

See [Scripting > Arrays](#arrays) for full method reference.

### Dictionaries

```typst
#let dict = (key: "value", num: 42)
#let empty = (:)
```

See [Scripting > Dictionaries](#dictionaries) for full method reference.

### Content

```typst
#let greeting = [Hello, *World*!]

// Content methods
#greeting.func()    // function that created it
#greeting.has("body")  // field check
#greeting.fields()  // dictionary of fields
```

### Datetime

```typst
#datetime.today()
#datetime(year: 2024, month: 1, day: 15)
#datetime(hour: 14, minute: 30, second: 0)

// Methods
#let d = datetime.today()
#d.year()      // int
#d.month()     // int
#d.day()       // int
#d.weekday()   // int (Monday=1)
#d.ordinal()   // day of year

// Display with format
#d.display("[year]-[month]-[day]")
#d.display("[weekday repr:long], [month repr:long] [day], [year]")

// Arithmetic
// datetime - datetime -> duration
// datetime +/- duration -> datetime
```

### Duration

```typst
#duration(days: 5, hours: 12, minutes: 30)

// Methods return total in that unit (float)
#let d = duration(hours: 2, minutes: 30)
#d.hours()    // 2.5
#d.minutes()  // 150.0
#d.seconds()  // 9000.0
```

### Regex

```typst
#let pattern = regex("\\d+")
#show pattern: set text(red)

// Raw string trick (avoids double backslash)
#let pattern = regex(`\d+`.text)
```

### Label

```typst
// Syntax
<label-name>

// Constructor
#label("my-label")

// Labels can contain: letters, numbers, _, -, :, .
= Heading <my-heading>
@my-heading  // reference it
```

### Calc Module

**Constants:** `calc.pi`, `calc.tau`, `calc.e`, `calc.inf`

**Functions:**
```typst
#calc.abs(-5)       // 5
#calc.pow(2, 10)    // 1024
#calc.exp(1)        // e
#calc.sqrt(16)      // 4
#calc.root(27, 3)   // 3

// Trigonometry
#calc.sin(90deg)    // 1.0
#calc.cos(0deg)     // 1.0
#calc.atan2(1, 1)   // 45deg

// Logarithms
#calc.log(100)      // 2.0 (base 10)
#calc.log(8, base: 2)  // 3.0
#calc.ln(calc.e)    // 1.0

// Rounding
#calc.floor(3.7)    // 3
#calc.ceil(3.2)     // 4
#calc.round(3.5)    // 4
#calc.round(3.456, digits: 2)  // 3.46
#calc.trunc(3.7)    // 3
#calc.fract(3.7)    // 0.7

// Clamping
#calc.clamp(15, 0, 10)  // 10
#calc.min(1, 2, 3)      // 1
#calc.max(1, 2, 3)      // 3

// Combinatorics
#calc.fact(5)        // 120
#calc.perm(5, 2)     // 20
#calc.binom(5, 2)    // 10
#calc.gcd(12, 8)     // 4
#calc.lcm(4, 6)      // 12

// Checks
#calc.even(4)       // true
#calc.odd(3)        // true

// Division
#calc.rem(7, 3)     // 1
#calc.quo(7, 3)     // 2
```

### Type Checking

```typst
#type(42)        // int
#type("hello")   // str
#type((1, 2))    // array
```

### Assertions

```typst
#assert(1 + 1 == 2)
#assert(value != none, message: "Value required")
#assert.eq(1 + 1, 2)
#assert.ne(1, 2)
```

### Other Utilities

```typst
#repr(42)       // "42" (debug representation)
#panic("error") // halt with error

// Eval (use as last resort)
#eval("1 + 2")                          // 3
#eval("*bold*", mode: "markup")         // content
#eval("x + 1", mode: "code", scope: (x: 2))  // 3

// Version
#sys.version   // current Typst version (comparable)

// Target (detect output format)
#if target() == "pdf" [PDF output]
#if target() == "html" [HTML output]
```

### Symbols

```typst
// Custom symbol with modifiers
#let my-sym = symbol(
  "★",
  ("filled", "★"),
  ("stroked", "☆"),
)
#my-sym           // ★
#my-sym.stroked   // ☆
```

### Plugins (WebAssembly)

```typst
#let module = plugin("plugin.wasm")
#let result = module.function(bytes("input"))

// With initialization side effects
#let module = plugin.transition(bytes => {
  plugin("plugin.wasm")
})
```

---

## 15. Document Model

### Document Metadata

```typst
#set document(
  title: "My Document",
  author: "John Doe",
  description: [A brief description],
  date: datetime.today(),
  keywords: ("typst", "document"),
)
```

### Headings

```typst
= Level 1
== Level 2
=== Level 3

// Function form
#heading(level: 2)[Level 2 Heading]

// Numbering patterns
#set heading(numbering: "1.1")
#set heading(numbering: "I.A.1")

// Control outline inclusion
#set heading(outlined: true)
#set heading(bookmarked: auto)

// Hanging indent for numbered headings
#set heading(hanging-indent: auto)

// Offset heading depth
#set heading(offset: 1)  // == becomes level 3 if base depth is 2
```

### Paragraphs

```typst
#set par(
  justify: true,
  leading: 0.65em,
  spacing: 1.2em,
  first-line-indent: 1em,
)

// First-line-indent for all paragraphs (including first)
#set par(first-line-indent: (amount: 1em, all: true))

// Hanging indent
#set par(hanging-indent: 2em)

// Linebreak optimization
#set par(linebreaks: "optimized")

// Justification limits (character-level)
#set par(justification-limits: (
  spacing: (min: 66.67% + 0pt, max: 150% + 0pt),
  tracking: (min: 0pt, max: 0pt),
))

// Line numbering
#set par.line(numbering: "1")
#set par.line(number-align: left)
#set par.line(numbering-scope: "page")

#parbreak()  // Force paragraph break
```

### Figures

```typst
#figure(
  image("chart.png"),
  caption: [Sales data for 2024.],
  alt: "Bar chart showing sales growth",
  supplement: [Figure],
  numbering: "1",
) <fig-sales>

// Floating figure
#figure(
  image("photo.jpg", width: 80%),
  caption: [A photo.],
  placement: auto,    // or top, bottom
  scope: "column",    // or "parent" for full-width
)

// Caption position
#show figure.where(kind: table): set figure.caption(position: top)

// Custom caption styling
#show figure.caption: it => [
  #it.supplement #context it.counter.display(it.numbering):
  #it.body
]
```

### Outline (Table of Contents)

```typst
#outline()

// Customized
#outline(
  title: [Contents],
  indent: auto,
  depth: 3,
)

// List of figures
#outline(
  title: [Figures],
  target: figure.where(kind: image),
)

// List of tables
#outline(
  title: [Tables],
  target: figure.where(kind: table),
)

// Custom fill
#set outline.entry(fill: line(length: 100%))

// Style specific levels
#show outline.entry.where(level: 1): set block(above: 1.2em)
```

### Bibliography and Citations

```typst
// BibTeX or Hayagriva YAML
#bibliography("refs.bib", style: "ieee")
#bibliography("refs.yaml", style: "apa")

// Full bibliography (include uncited)
#bibliography("refs.bib", full: true)

// Citation
@einstein1905
@einstein1905[p.~7]

// Citation forms
#cite(<key>, form: "prose")    // "Einstein (1905)"
#cite(<key>, form: "full")     // Full citation
#cite(<key>, form: "author")   // "Einstein"
#cite(<key>, form: "year")     // "(1905)"
```

**Built-in styles:** `"ieee"`, `"apa"`, `"chicago-author-date"`, `"chicago-notes"`, `"mla"`, `"harvard-cite-them-right"`, `"american-physics-society"`, plus 100+ CSL styles.

### Numbering Patterns

```typst
#numbering("1.1)", 1, 2, 3)     // "1.2.3)"
#numbering("1.a.i", 1, 2)       // "1.b"
#numbering("I -- 1", 12, 2)     // "XII -- 2"

// Custom function
#numbering((..nums) => {
  nums.pos().map(str).join(".") + ")"
}, 1, 2, 3)
```

**Counting symbols:** `1` (arabic), `a`/`A` (latin), `i`/`I` (roman), `*` (daggers), and various scripts (Chinese, Japanese, Hebrew, Korean, Arabic-Indic, Devanagari, Bengali, circled).

### References

```typst
= Introduction <intro>

See @intro for the introduction.

// Custom supplement
#ref(<intro>, supplement: [Chapter])

// Page reference
#ref(<intro>, form: "page")

// Custom reference format via show rule
#show ref.where(form: "normal"): set ref(supplement: it => {
  if it.func() == heading { "Chapter" } else { "Thing" }
})
```

### Strong and Emphasis

```typst
*bold text*        // strong (adds delta: 300 to weight)
_italic text_      // emph (toggles italic)

// Customize
#set strong(delta: 0)  // disable bold effect
#show strong: set text(red)
#show emph: it => text(blue, it.body)
```

---

## 16. Templates

### Creating a Template Function

```typst
// In template.typ
#let my-template(
  title: none,
  author: none,
  body,
) = {
  set document(title: title, author: author)
  set page(margin: 2cm)
  set text(font: "New Computer Modern", size: 11pt)
  set par(justify: true)

  // Title block
  align(center)[
    #text(size: 20pt, weight: "bold")[#title]
    #v(1em)
    #text(size: 12pt)[#author]
  ]

  v(2em)
  body
}
```

### Using a Template

```typst
#import "template.typ": my-template

#show: my-template.with(
  title: [My Document],
  author: [John Doe],
)

= Introduction

Document content here...
```

### The Everything Show Rule

```typst
#show: rest => {
  set text(font: "Arial")
  rest
}
```

### Reusable Components

```typst
#let note(body) = block(
  fill: yellow.lighten(80%),
  inset: 1em,
  radius: 4pt,
)[
  *Note:* #body
]

#note[Remember to save your work!]
```

### Template with Dynamic Content

```typst
#let author-list(authors) = {
  authors.map(a => a.name).join(", ", last: " and ")
}

#let paper(
  title: none,
  authors: (),
  abstract: none,
  body,
) = {
  set document(title: title)
  align(center)[
    #text(size: 18pt)[#title]
    #v(1em)
    #author-list(authors)
  ]

  if abstract != none {
    heading(level: 2, outlined: false)[Abstract]
    abstract
  }

  body
}
```

---

## 17. Symbols Reference

### Markup Mode Shorthands

| Input | Output | Description |
|-------|--------|-------------|
| `--` | -- | En dash |
| `---` | --- | Em dash |
| `...` | ... | Ellipsis |
| `-?` | (soft hyphen) | Soft hyphen |
| `~` | (nbsp) | Non-breaking space |
| `'` | ' | Smart single quote |
| `"` | " | Smart double quote |

### Math Mode Shorthands

| Input | Output | Description |
|-------|--------|-------------|
| `->` | right arrow | Right arrow |
| `<-` | left arrow | Left arrow |
| `<->` | bidirectional | Bidirectional arrow |
| `=>` | double right | Double right arrow (implies) |
| `<=` | less-equal | Less than or equal |
| `>=` | greater-equal | Greater than or equal |
| `!=` | not equal | Not equal |
| `:=` | definition | Definition |
| `...` | ellipsis | Ellipsis |
| `*` | dot | Dot operator |

### Common Symbols

```typst
// Greek letters
$alpha, beta, gamma, delta, epsilon$
$Alpha, Beta, Gamma, Delta$
$pi, sigma, omega, phi, psi, theta$

// Blackboard bold (number sets)
$NN, ZZ, QQ, RR, CC$
// Also via function: $bb(N), bb(Z), bb(Q), bb(R), bb(C)$

// Operators
$plus, minus, times, div$
$sum, product, integral$
$integral.double, integral.triple, integral.cont$

// Relations
$lt, gt, eq, approx, equiv$
$subset, supset, in, notin$

// Arrows (extensive collection)
$arrow.r, arrow.l, arrow.t, arrow.b$
$arrow.r.long, arrow.r.double$
$arrow.r.squiggly, arrow.r.hook$

// Differential
$dif x$  // The d in dx integrals

// Logical
$and, or, not$
$forall, exists$

// Miscellaneous
$infinity, emptyset, checkmark$
```

### Symbol Modifiers

Access variants via dot notation. Order is irrelevant:

```typst
$gt.eq.not$     // ≱ (not greater or equal)
$arrow.r.long$  // long right arrow
$star.filled$   // ★
```

### Emoji

```typst
#emoji.face.smile
#emoji.heart
#emoji.checkmark

// Import for convenience
#import sym: arrow
#import emoji: face
```

---

## 18. PDF & HTML Export

### PDF Export

```bash
# Default PDF export
typst compile document.typ

# Specific output file
typst compile document.typ output.pdf

# PDF standard
typst compile --pdf-standard a-2b document.typ

# Multiple standards
typst compile --pdf-standard a-2b,ua-1 document.typ

# Page selection
typst compile --pages 1-5,10 document.typ

# Watch mode (auto-recompile)
typst watch document.typ

# Disable PDF tags
typst compile --no-pdf-tags document.typ
```

### PDF Standards

| Standard | Description |
|----------|-------------|
| `1.4` - `2.0` | PDF versions |
| `a-1b`, `a-1a` | PDF/A-1 archival (PDF 1.4 based) |
| `a-2b`, `a-2u`, `a-2a` | PDF/A-2 archival (PDF 1.7 based) |
| `a-3b`, `a-3u`, `a-3a` | PDF/A-3 (allows non-PDF/A attachments) |
| `a-4`, `a-4f`, `a-4e` | PDF/A-4 (PDF 2.0 based) |
| `ua-1` | PDF/UA Universal Access |

PDFs are tagged by default for accessibility.

### PDF Module Functions

```typst
// Mark decorative content as artifact (hidden from AT)
#pdf.artifact()[
  #line(length: 100%)
]

// Attach files to PDF
#pdf.attach(
  "data.csv",
  read("data.csv", encoding: none),
  description: "Raw data",
  relationship: "data",
)
```

**Experimental (requires `--features a11y-extras`):**
- `pdf.header-cell` / `pdf.data-cell` -- table cell roles
- `pdf.table-summary` -- complex table descriptions

### HTML Export (Experimental)

Requires `--features html` flag or `TYPST_FEATURES=html` env var.

```bash
# Compile to HTML
typst compile --format html --features html document.typ output.html

# Watch with live reload server
typst watch --format html --features html document.typ
# Defaults to port 3000-3005
```

```typst
// Detect output format
#if target() == "html" [
  This only appears in HTML output.
]

// Raw HTML elements
#html.elem("div", attrs: (class: "note"))[Content]

// Inline SVG rendering
#html.frame[Content rendered as SVG]
```

### CLI Commands

```bash
# Compile
typst compile document.typ [output]

# Watch
typst watch document.typ [output]

# Query document (extract metadata/elements)
typst query document.typ "<label>" --field value --one

# Document info
typst info document.typ

# Shell completions
typst completions bash  # or zsh, fish, powershell

# Dependency tracking
typst compile --deps deps.txt --deps-format json document.typ
```

---

## 19. For LaTeX Users

### Syntax Comparison

| Element | LaTeX | Typst |
|---------|-------|-------|
| Bold | `\textbf{text}` | `*text*` |
| Italic | `\emph{text}` | `_text_` |
| Heading | `\section{Title}` | `= Title` |
| Bullet list | `\begin{itemize}` | `- item` |
| Numbered list | `\begin{enumerate}` | `+ item` |
| Term list | `\begin{description}` | `/ Term: desc` |
| Link | `\url{...}` | `https://...` |
| Reference | `\ref{label}` | `@label` |
| Label | `\label{name}` | `<name>` |
| Code | `\verb\|code\|` | `` `code` `` |
| Fraction | `\frac{a}{b}` | `$a/b$` or `$frac(a,b)$` |
| Image | `\includegraphics` | `#image("file")` |
| Citation | `\cite{key}` | `@key` |
| Footnote | `\footnote{text}` | `#footnote[text]` |

### Key Differences

1. **No preamble** -- documents start immediately with content
2. **No packages to load** -- most features are built-in
3. **Functions vs macros** -- Typst uses pure functions with `#`
4. **Set rules** -- replace LaTeX declaration commands
5. **Show rules** -- replace LaTeX environments for customization
6. **No `\left`/`\right`** -- delimiters auto-scale in math mode
7. **Packages download automatically** on first use

### Common Equivalents

| LaTeX Package | Typst Equivalent |
|---------------|-----------------|
| `geometry` | `#set page(...)` |
| `xcolor` | `#set text(fill: ...)` |
| `hyperref` | Built-in links |
| `amsmath` | Built-in math |
| `graphicx` | `#image(...)` |
| `biblatex/bibtex` | `#bibliography(...)` |
| `fontspec` | `#set text(font: ...)` |
| `enumitem` | `#set list(...)` / `#set enum(...)` |
| `fancyhdr` | `#set page(header: ..., footer: ...)` |

### Achieving LaTeX Appearance

```typst
#set page(margin: 1.75in)
#set par(leading: 0.55em, justify: true, first-line-indent: 1.8em)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#set heading(numbering: "1.1")
```

### Template Conversion

**LaTeX:**
```latex
\documentclass[12pt]{article}
\usepackage[margin=1in]{geometry}
\begin{document}
\title{My Document}
\author{John Doe}
\maketitle
Content here...
\end{document}
```

**Typst:**
```typst
#set page(margin: 1in)
#set text(size: 12pt)

#align(center)[
  #text(size: 20pt)[*My Document*]

  John Doe
]

Content here...
```

---

## 20. Accessibility

### Semantic Markup

Use semantic elements instead of raw styling:

```typst
// Good - semantic
= Heading
_emphasized_
*strong*

// Avoid - purely visual
#text(size: 16pt, weight: "bold")[Heading]
```

### Alt Text for Images

```typst
#image(
  "chart.png",
  alt: "Bar chart showing sales growth from 2020 to 2024",
)

// Or via figure
#figure(
  image("chart.png"),
  alt: "Bar chart of sales data",
  caption: [Sales growth],
)
```

### Alt Text for Math

```typst
#math.equation(
  alt: "The quadratic formula: x equals negative b plus or minus the square root of b squared minus 4ac, all over 2a",
  block: true,
  $ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $,
)
```

### Document Structure

```typst
// Set document metadata
#set document(
  title: "Accessible Document",
  author: "Author Name",
  description: [A brief description of the document],
)

// Set language
#set text(lang: "en")

// Use sequential heading levels (don't skip)
= Level 1
== Level 2
=== Level 3
```

### Artifacts (Decorative Elements)

```typst
// Mark purely decorative elements
#pdf.artifact()[
  #line(length: 100%)
]
```

Header, footer, foreground, and background page content is automatically treated as artifacts.

### Tables with Headers

```typst
#table(
  columns: 3,
  table.header(
    [*Name*], [*Age*], [*City*],
  ),
  [Alice], [30], [Prague],
  [Bob], [25], [Brno],
)
```

### PDF/UA Compliance

For full PDF/UA-1 compliance:
- Set document `title` and text `lang`
- Use semantic elements (headings, figures, lists)
- Provide alt text for images and equations
- Use `table.header` for table headers
- Wrap decorative elements in `pdf.artifact()`
- Don't rely on color alone to convey information
- Aim for 4.5:1 contrast ratio for normal text

```bash
# Compile with PDF/UA standard
typst compile --pdf-standard ua-1 document.typ
```

### Testing Accessibility

- Use veraPDF for PDF/A and PDF/UA validation
- Use PAC (PDF Accessibility Checker)
- Test with screen readers (NVDA, VoiceOver, JAWS)

---

## Quick Reference Card

### Essential Markup

```
= Heading 1          == Heading 2         === Heading 3
*bold*               _italic_             `code`
- bullet             + numbered           / term: definition
@label               <label>              #link("url")[text]
```

### Essential Functions

```typst
#set text(font: "...", size: 12pt)
#set page(margin: 2cm, paper: "a4")
#set par(justify: true)
#set heading(numbering: "1.1")

#image("file.png", width: 50%)
#table(columns: 3, [...], [...], [...])
#figure(content, caption: [...])

#let var = value
#if cond [...] else [...]
#for item in list [...]
```

### Common Math

```typst
$x^2$  $x_i$  $sqrt(x)$  $frac(a,b)$
$sum_(i=1)^n$  $integral_0^1$  $lim_(x->0)$
$alpha, beta, gamma$  $pi, theta, omega$
$forall, exists, in, subset$
$arrow.r, =>$  $NN, RR, ZZ$
```

---

*This guide covers Typst 0.14.x. Based on the official documentation at https://typst.app/docs/*
