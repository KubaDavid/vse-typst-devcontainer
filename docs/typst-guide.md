# Typst Comprehensive Guide

A complete reference for the Typst typesetting system.

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
18. [PDF Export](#18-pdf-export)
19. [For LaTeX Users](#19-for-latex-users)
20. [Accessibility](#20-accessibility)

---

## 1. Introduction

Typst is a modern markup-based typesetting system designed as an alternative to LaTeX. It combines the power of advanced typesetting with a simpler, more intuitive syntax.

### Key Features

- **Fast compilation** - Incremental compilation for near-instant preview
- **Simple syntax** - Clean markup without complex commands
- **Powerful scripting** - Built-in programming capabilities
- **Modern tooling** - Web app and CLI available

### Three Modes

Typst operates in three syntactical modes:

| Mode | Purpose | Entry |
|------|---------|-------|
| **Markup** | Document content (default) | Default mode |
| **Code** | Programming and logic | `#` prefix |
| **Math** | Mathematical formulas | `$...$` delimiters |

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

- Backslash `\` escapes special characters
- Unicode: `\u{1f600}` for emoji/special characters

### Identifiers

Variable and function names can contain:
- Letters (including Unicode)
- Numbers (not at start)
- Hyphens and underscores

```typst
#let my-variable = "value"
#let _private = 42
```

### Paths

- Relative paths: `"image.png"` (from current file)
- Absolute paths: `"/assets/image.png"` (from project root)

---

## 3. Writing in Typst

### Headings

```typst
= Level 1 Heading
== Level 2 Heading
=== Level 3 Heading
==== Level 4 Heading
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
```

### Images

```typst
#image("photo.jpg")

// With size constraints
#image("photo.jpg", width: 50%)
#image("diagram.svg", height: 5cm)
```

### Figures with Captions

```typst
#figure(
  image("glacier.jpg", width: 70%),
  caption: [A beautiful glacier in the mountains.],
) <fig-glacier>

See @fig-glacier for the image.
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
- `text` - font, size, color, weight
- `page` - size, margins, headers, footers
- `par` - justify, leading, first-line-indent
- `heading` - numbering, outlined
- `list` / `enum` - marker, indent

### Show Rules

Show rules redefine how elements appear:

**Text replacement:**
```typst
#show "Typst": smallcaps[Typst]
```

**Element styling:**
```typst
#show heading: set text(navy)
```

**Transformational show rules:**
```typst
#show heading: it => block[
  #set text(red)
  Chapter: #it.body
]
```

### Show-Set Rules

Combine selectors with set rules:

```typst
#show heading.where(level: 1): set text(size: 20pt)
#show heading.where(level: 2): set text(style: "italic")
```

### Selectors

```typst
// By element type
#show heading: ...

// By level/property
#show heading.where(level: 1): ...

// By text content
#show "word": ...

// By regex pattern
#show regex("\d+"): ...

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

---

## 5. Page Setup

### Page Sizes

```typst
// Predefined sizes
#set page(paper: "a4")
#set page(paper: "us-letter")

// Custom size
#set page(width: 15cm, height: 20cm)
```

**Available paper sizes:** a0-a10, iso-b0-b8, iso-c0-c8, us-letter, us-legal, us-executive

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

// For bound documents (alternating)
#set page(margin: (inside: 3cm, outside: 2cm))
```

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

**Conditional headers:**
```typst
#set page(header: context {
  if counter(page).get().first() > 1 [
    Chapter Header
  ]
})
```

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
#set page(number-align: center)
```

**Reset page counter:**
```typst
#counter(page).update(1)
```

### Columns

```typst
#set page(columns: 2)

// Or use columns function
#columns(2, gutter: 1cm)[
  Content in columns...
]
```

### One-off Page Changes

```typst
// Landscape page
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
```

**Key parameters:**
- `font` - font family name
- `size` - font size (pt, em, etc.)
- `fill` - text color
- `weight` - "regular", "bold", "light", etc.
- `style` - "normal", "italic", "oblique"
- `tracking` - letter spacing
- `lang` - language code (e.g., "en", "cs")

### Case Conversion

```typst
#upper[lowercase to uppercase]
#lower[UPPERCASE TO LOWERCASE]
#smallcaps[Small Capitals]
```

### Text Decorations

```typst
#underline[Underlined text]
#strike[Strikethrough text]
#overline[Overlined text]

// Customized
#underline(stroke: 2pt + red, offset: 2pt)[Custom underline]
```

### Subscript and Superscript

```typst
H#sub[2]O is water.
E = mc#super[2]
```

### Raw Text and Code

```typst
// Inline code
`let x = 5`

// Code block
```python
def hello():
    print("Hello!")
```

// Without syntax highlighting
```text
Plain text block
```
```

### Highlighting

```typst
#highlight[Important text]
#highlight(fill: yellow)[Yellow highlight]
```

### Smart Quotes

```typst
"Double quotes" and 'single quotes'

// Language-aware
#set text(lang: "de")
"German quotes" // Uses „..."
```

### Line Breaks

```typst
#linebreak()   // Force line break
Text \ break   // Backslash also works
```

### Lorem Ipsum

```typst
#lorem(50)  // Generate 50 words of placeholder text
```

---

## 7. Mathematics

### Inline vs Display Math

```typst
// Inline math (no spaces around $)
The formula $x^2 + y^2 = r^2$ is inline.

// Display math (spaces around $)
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
$ (a + b) / c $   // Fraction
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
```

### Alignment

```typst
$ x &= 2 + 3 \
  &= 5 $
```

### Cases

```typst
$ f(x) = cases(
  0 &"if" x < 0,
  1 &"if" x >= 0,
) $
```

### Fractions and Binomials

```typst
$ frac(a, b) $
$ binom(n, k) = frac(n!, k!(n-k)!) $
```

### Limits and Big Operators

```typst
$ lim_(x -> infinity) 1/x = 0 $
$ sum_(i=0)^n a_i $
$ product_(i=1)^n i = n! $
```

### Math Functions Reference

| Function | Description |
|----------|-------------|
| `frac(a, b)` | Fraction |
| `sqrt(x)` | Square root |
| `root(n, x)` | Nth root |
| `vec(...)` | Vector |
| `mat(...; ...)` | Matrix |
| `cases(...)` | Cases |
| `binom(n, k)` | Binomial |
| `abs(x)` | Absolute value |
| `norm(x)` | Norm |
| `floor(x)` | Floor |
| `ceil(x)` | Ceiling |
| `cancel(x)` | Strikethrough |

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

### With Semantic Header

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
```

### Styling and Colors

```typst
// Zebra stripes (by row)
#set table(
  fill: (_, y) => if calc.odd(y) { luma(240) },
)

// Column-based fill
#set table(fill: (blue.lighten(80%), none))

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

// Custom lines
#table(
  columns: 2,
  [A], [B],
  table.hline(stroke: 2pt),
  [C], [D],
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

// Per column
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

### Grid vs Table

Use `grid` for layout (no semantic table meaning):

```typst
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [Left content],
  [Right content],
)
```

---

## 9. Layout

### Alignment

```typst
#align(center)[Centered content]
#align(right)[Right-aligned]
#align(left + bottom)[Bottom-left]

// Alignment values: left, center, right, top, horizon, bottom
```

### Horizontal and Vertical Spacing

```typst
Word #h(1cm) Word    // Horizontal space
Word #h(1fr) Word    // Flexible space (push apart)

#v(2em)              // Vertical space
```

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

#box(stroke: 1pt + black, inset: 0.5em)[Bordered box]
```

### Block (Block-level Container)

```typst
#block(width: 100%, fill: luma(230), inset: 1em)[
  Block content
]

#block(spacing: 2em)[Spaced block]
```

### Stack

```typst
// Vertical stack (default)
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

### Place (Absolute Positioning)

```typst
#place(top + right)[Top right corner]

#place(
  dx: 2cm,
  dy: 3cm,
)[Offset placement]

// Floating placement
#place(
  float: true,
  scope: "column",
  auto,
)[Floating element]
```

### Transformations

```typst
#rotate(45deg)[Rotated 45°]
#scale(x: 150%, y: 100%)[Scaled horizontally]
#move(dx: 1cm, dy: -0.5cm)[Moved content]
#skew(ax: 10deg)[Skewed text]
```

### Hide (Invisible but Takes Space)

```typst
#hide[This takes space but is invisible]
```

### Repeat

```typst
#repeat[.]  // Fills available space with dots
```

### Measure

```typst
#context {
  let size = measure[Hello]
  [Width: #size.width, Height: #size.height]
}
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
- `width`, `height` - size constraints
- `fit` - "cover", "contain", "stretch"
- `alt` - alternative text for accessibility

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

### Lines

```typst
#line(length: 5cm)
#line(start: (0pt, 0pt), end: (3cm, 1cm))
#line(length: 100%, stroke: 2pt + red)
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
```

### Path (Bézier Curves)

```typst
#path(
  fill: purple,
  closed: true,
  (0pt, 0pt),
  (1cm, 2cm),
  (2cm, 0pt),
)
```

### Colors

```typst
// Named colors
#text(fill: red)[Red]
#text(fill: blue)[Blue]

// RGB
#text(fill: rgb(255, 128, 0))[Orange]
#text(fill: rgb("#ff8000"))[Orange hex]
#text(fill: rgb("ff8000"))[Orange hex]

// CMYK
#text(fill: cmyk(0%, 50%, 100%, 0%))[CMYK Orange]

// Grayscale
#text(fill: luma(128))[Gray]
#text(fill: luma(50%))[Gray percentage]

// Color modifications
#text(fill: blue.lighten(50%))[Light blue]
#text(fill: red.darken(30%))[Dark red]
#text(fill: green.saturate(50%))[Saturated green]
```

### Gradients

```typst
#rect(
  width: 5cm,
  height: 2cm,
  fill: gradient.linear(red, blue),
)

#circle(
  radius: 2cm,
  fill: gradient.radial(yellow, orange, red),
)
```

### Stroke

```typst
#rect(
  stroke: (
    paint: blue,
    thickness: 2pt,
    dash: "dashed",
  ),
)

// Stroke shorthand
#line(stroke: 3pt + red)
```

---

## 11. Scripting

### Variables

```typst
#let name = "Typst"
#let count = 42
#let items = (1, 2, 3)

The name is #name and count is #count.
```

### Functions

```typst
// Basic function
#let greet(name) = [Hello, #name!]
#greet("World")

// With default parameter
#let greet(name, greeting: "Hello") = [#greeting, #name!]
#greet("World", greeting: "Hi")

// Content parameter
#let important(body) = [*#body*]
#important[This is important]
```

### Conditionals

```typst
#let x = 5

#if x > 0 [
  Positive
] else if x < 0 [
  Negative
] else [
  Zero
]
```

### Loops

**For loops:**
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
```

### Arrays

```typst
#let arr = (1, 2, 3)
#arr.at(0)         // 1
#arr.len()         // 3
#arr.first()       // 1
#arr.last()        // 3
#arr.slice(1, 3)   // (2, 3)
#arr.contains(2)   // true
#arr.map(x => x * 2)        // (2, 4, 6)
#arr.filter(x => x > 1)     // (2, 3)
#arr.fold(0, (acc, x) => acc + x)  // 6
#arr.join(", ")    // "1, 2, 3"
```

### Dictionaries

```typst
#let dict = (name: "Alice", age: 30)
#dict.name         // "Alice"
#dict.at("age")    // 30
#dict.keys()       // ("name", "age")
#dict.values()     // ("Alice", 30)
#dict.pairs()      // (("name", "Alice"), ("age", 30))
```

### Modules and Imports

**Import entire file:**
```typst
#import "utils.typ"
#utils.my-function()
```

**Import specific items:**
```typst
#import "utils.typ": my-function, my-variable
#my-function()
```

**Import with rename:**
```typst
#import "utils.typ" as u
#u.my-function()
```

**Include (insert content):**
```typst
#include "chapter1.typ"
```

### Packages

```typst
// Import from Typst Universe
#import "@preview/package-name:0.1.0": function-name

// Example
#import "@preview/cetz:0.2.0": canvas, draw
```

### Operators Reference

| Operator | Description |
|----------|-------------|
| `+`, `-`, `*`, `/` | Arithmetic |
| `==`, `!=` | Equality |
| `<`, `>`, `<=`, `>=` | Comparison |
| `and`, `or`, `not` | Logical |
| `in`, `not in` | Membership |
| `=`, `+=`, `-=`, `*=`, `/=` | Assignment |

---

## 12. Context & Introspection

### Context Keyword

Context enables code to react to its position in the document:

```typst
#context {
  [Current page: #counter(page).get().first()]
}
```

### Style Context

Access style properties set via set rules:

```typst
#set text(lang: "de")
#context text.lang  // "de"
```

### Location Context

```typst
#context {
  let loc = here()
  [Position: page #loc.page()]
}
```

### Counters

```typst
// Built-in counters
#set heading(numbering: "1.")
#context counter(heading).get()

// Custom counter
#let my-counter = counter("my-counter")
#my-counter.step()
#context my-counter.display()

// Update counter
#counter(page).update(1)
#counter(page).update(n => n + 5)
```

### State

```typst
#let total = state("total", 0)

#total.update(x => x + 10)
#total.update(x => x + 20)

#context [Total: #total.get()]  // 30
```

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

### Locate

Get position of labeled elements:

```typst
= Introduction <intro>

#context {
  let pos = locate(<intro>).position()
  [Intro is on page #pos.page]
}
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
```

### JSON

```typst
#let config = json("config.json")
#config.title
#config.settings.theme
```

### YAML

```typst
#let data = yaml("data.yaml")
#data.name
```

### TOML

```typst
#let config = toml("config.toml")
#config.section.key
```

### XML

```typst
#let doc = xml("data.xml")
// Navigate XML structure
```

### Plain Text

```typst
#let content = read("file.txt")
#content
```

### CBOR

```typst
#let data = cbor("data.cbor")
```

---

## 14. Foundations (Data Types)

### Basic Types

| Type | Description | Example |
|------|-------------|---------|
| `int` | Integer | `42`, `-5` |
| `float` | Floating-point | `3.14`, `1e-5` |
| `bool` | Boolean | `true`, `false` |
| `str` | String | `"hello"` |
| `none` | Absence of value | `none` |
| `auto` | Automatic value | `auto` |

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

### Arrays

```typst
#let arr = (1, 2, 3)
#let empty = ()
#let single = (1,)  // Note trailing comma
```

### Dictionaries

```typst
#let dict = (key: "value", num: 42)
#let empty = (:)
```

### Content

```typst
#let greeting = [Hello, *World*!]
```

### Datetime

```typst
#datetime.today()
#datetime(year: 2024, month: 1, day: 15)
```

### Duration

```typst
#duration(days: 5, hours: 12)
```

### Regex

```typst
#let pattern = regex("\d+")
#show pattern: set text(red)
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
```

---

## 15. Document Model

### Document Metadata

```typst
#set document(
  title: "My Document",
  author: "John Doe",
  date: datetime.today(),
  keywords: ("typst", "document"),
)
```

### Headings

```typst
= Level 1
== Level 2
=== Level 3

// Or function form
#heading(level: 2)[Level 2 Heading]

// Numbering
#set heading(numbering: "1.1")
#set heading(numbering: "I.A.1")
```

### Paragraphs

```typst
#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 1em,
)

#parbreak()  // Force paragraph break
```

### Emphasis

```typst
#emph[Emphasized text]    // Same as _text_
#strong[Strong text]      // Same as *text*
```

### Figures

```typst
#figure(
  image("chart.png"),
  caption: [Sales data for 2024.],
  supplement: [Figure],
  numbering: "1",
) <fig-sales>
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

### Bibliography and Citations

```typst
#set document(title: "Research Paper")

@einstein1905 proposed the theory.

Multiple citations: @einstein1905 @feynman1965

#bibliography("refs.bib", style: "ieee")
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

// Table of figures
#outline(
  title: [Figures],
  target: figure.where(kind: image),
)
```

### Links

```typst
#link("https://typst.app")[Typst]
#link(<section-label>)[Jump to section]
```

### References

```typst
= Introduction <intro>

See @intro for the introduction.

#ref(<intro>, supplement: [Chapter])
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

  // Title
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

### Template Variables

```typst
#let version = "1.0"
#let company = [Acme Corp]

The current version is #version by #company.
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
| `--` | – | En dash |
| `---` | — | Em dash |
| `...` | … | Ellipsis |
| `-?` | (soft hyphen) | Soft hyphen |
| `~` | (nbsp) | Non-breaking space |
| `'` | ' | Smart single quote |
| `"` | " | Smart double quote |

### Math Mode Shorthands

| Input | Output | Description |
|-------|--------|-------------|
| `->` | → | Right arrow |
| `<-` | ← | Left arrow |
| `<->` | ↔ | Bidirectional arrow |
| `=>` | ⇒ | Double right arrow |
| `<=` | ≤ | Less than or equal |
| `>=` | ≥ | Greater than or equal |
| `!=` | ≠ | Not equal |
| `:=` | ≔ | Definition |
| `...` | … | Ellipsis |
| `*` | · | Dot operator |

### Common Symbols

```typst
// Greek letters
$alpha, beta, gamma, delta, epsilon$
$Alpha, Beta, Gamma, Delta$
$pi, sigma, omega, phi, psi$

// Operators
$plus, minus, times, div$
$sum, product, integral$

// Relations
$lt, gt, eq, approx, equiv$
$subset, supset, in, notin$

// Arrows
$arrow.r, arrow.l, arrow.t, arrow.b$
$arrow.r.long, arrow.double$

// Sets
$NN, ZZ, QQ, RR, CC$  // Number sets
```

### Emoji

```typst
#emoji.face.smile
#emoji.heart
#emoji.checkmark
```

---

## 18. PDF Export

### Command Line Export

```bash
# Default PDF export
typst compile document.typ

# Specific PDF standard
typst compile --pdf-standard a-2b document.typ

# Page selection
typst compile --pages 1-5,10 document.typ

# Watch mode
typst watch document.typ
```

### PDF Standards

| Standard | Description |
|----------|-------------|
| `1.4` - `2.0` | PDF versions |
| `a-1b`, `a-2b`, `a-3b` | PDF/A archival (basic) |
| `a-2u`, `a-3u` | PDF/A with Unicode |
| `a-2a`, `a-3a` | PDF/A with accessibility |
| `ua-1` | PDF/UA Universal Access |

### Accessibility Features

```typst
// Set document language
#set text(lang: "en")

// Set document title
#set document(title: "Accessible Document")

// Alt text for images
#image("photo.jpg", alt: "A mountain landscape")

// Alt text for equations
$ E = m c^2 $ <eq-energy>
#set math.equation(alt: "E equals m c squared")

// Mark decorative elements as artifacts
#pdf.artifact()[Decorative line]
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
| Link | `\url{...}` | `https://...` |
| Reference | `\ref{label}` | `@label` |
| Label | `\label{name}` | `<name>` |
| Code | `\verb|code|` | `` `code` `` |
| Fraction | `\frac{a}{b}` | `$a/b$` or `$frac(a,b)$` |
| Image | `\includegraphics` | `#image("file")` |

### Key Differences

1. **No preamble** - Typst documents start immediately with content
2. **No packages to load** - Most features are built-in
3. **Functions vs macros** - Typst uses pure functions
4. **Set rules** - Replace LaTeX declaration commands
5. **Show rules** - Replace LaTeX environments for customization

### Common Equivalents

| LaTeX Package | Typst Equivalent |
|---------------|------------------|
| `geometry` | `#set page(...)` |
| `xcolor` | `#set text(fill: ...)` |
| `hyperref` | Built-in links |
| `amsmath` | Built-in math |
| `graphicx` | `#image(...)` |
| `biblatex` | `#bibliography(...)` |
| `fontspec` | `#set text(font: ...)` |

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
```

### Alt Text for Math

```typst
#set math.equation(alt: "The quadratic formula")
$ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $
```

### Document Structure

```typst
// Set document metadata
#set document(
  title: "Accessible Document",
  author: "Author Name",
)

// Set language
#set text(lang: "en")

// Use sequential heading levels (don't skip)
= Level 1
== Level 2
=== Level 3
```

### Color Contrast

- Aim for 4.5:1 contrast ratio for normal text
- Aim for 3:1 for large text and graphics
- Don't rely on color alone to convey information

### Artifacts (Decorative Elements)

```typst
// Mark purely decorative elements
#pdf.artifact()[
  #line(length: 100%)
]
```

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

### Testing Accessibility

- Use veraPDF for PDF/A and PDF/UA validation
- Use PAC (PDF Accessibility Checker)
- Test with screen readers (NVDA, VoiceOver)

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
$arrow.r, =>$
```

---

*This guide is based on the official Typst documentation at https://typst.app/docs/*
