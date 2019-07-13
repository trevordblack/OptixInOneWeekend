# Style Guide Writing #

Style guide is a strict subset of Github Flavored Markdown (GFM)

## Headings ##
- All headings are ATX Headings.
- All headings are terminated by unescaped `#`s equal to opening
- All headings have exactly 1 space between text and unescaped `#`s

```
# Heading #

## Smaller Heading ##

### Smaller Still ###
```

## Fenced Code Blocks ##
- All Fenced code blocks follow \`\`\` and end with \`\`\`
~~~
```
// This is come c++ code
```
~~~
is rendered as:
```
// This is come c++ code
```

## Lists ##
Indents use exactly 2 spaces

### Bullet Lists ###
- All bullet lists begin with `-`

### Ordered Lists ###
- All ordered lists start with `1.`
- Use of `)` is strictly disallowed

## Code Spans ##
- Use Sparingly.
```
A line of text with `code` here and `code over here`
```
is rendered as:

A line of text with `code` here and `code over here`

## Emphasis ##
- Use of `*` for emphasis (no `_` is used)
```
Well, If you want to sing out, **sign out**
And if you want to be free, *be free* 
Cause there's a ***million things to be***
```
is rendered as:

Well, If you want to sing out, **sign out**\
And if you want to be free, *be free*\
Cause there's a ***million things to be***

## Images ##
- Alt text is not allowed
- syntax is the markdown spec

```
![](Location of image)
```

## Line Breaks ##
- No text lines end with spaces
  - all lines must end with text or `\`
  - Be followed by a newline
- Soft line breaks are constructed with `\`
- Hard line breaks are constructed with 2 newlines

## Strictly disallowed subset of GFM ##
- Tabs (May revisit this in future revisions)
- Thematic Breaks
- Setext headings
- Indented code blocks
- HTML blocks
- Tables (May revisit this in future revisions)
- Blockquotes
- Task lists
- Strikethrough emphasis
- Links
- Autolinks
- Raw HTML
