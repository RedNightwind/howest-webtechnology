---
title: HTML and CSS
---

# HTML and CSS

HTML can be styled via CSS. An HTML-element is selected via [CSS selectors](#css-selectors).
Styles/rules are defined per selector block. Each definition is
terminated by a `;`. A rules block is enclosed by `{`, `}`.

```css
<selector> {
    <property> : <value>;
    <property> : <value> <value>;
}
```

## Include style information

Elements can be styled via three methods:

* style-attribute <small>(discouraged)</small>
* a style tag in the head <small>(less discouraged)</small>
* an external stylesheet <small>(encouraged)</small>

### Style attribute

```html
<element style="/* my styles */"></element>
```

Use this method to quickly test some rule. Not as a permanent style.  **This way
of managing styles is discouraged** because it is a less maintainable way of
styling web-pages.  For example: styles can not be shared by elements...

### Style tag

The m4_tag(style)-tag that should be defined in the head of the document. The styles
defined in this tag apply to the complete page.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My pae title</title>

    <style type="text/css">
        .selector {

            property: value;
        }
    </style>

</head>
<body>
    <!-- the body -->
</body>
</html>
```

Even though the styles are defined only once, elements can share them via
selectors ( tag-name, classes, ...)

### External style sheet

The CSS-rules can also be defined in a dedicated CSS-file. This file can be
included in a web-page via the m4_tag(link)-tag

The rules defined in the file can be included in as many HTML-pages as you
want. This makes it the most scalable method of defining and including
CSS-rules.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My pae title</title>

    <link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
    <!-- the body -->
</body>
</html>
```

## CSS selectors

In order to apply rules to a certain element, the element must be targeted, selected.

CSS has the notion of selectors to target elements.

### Tag-name

The tag-name can be used to style all the same tags the same way.

m4_embed_php_as_html(html-and-css/tag-selector,,.html)

### ID

The id attribute can be used to give an element an unique identifier. This id
can be selected via CSS.

A pound symbol `#` indicates the following string is an id-name:

m4_embed_php_as_html(html-and-css/id-selector,,.html)


### Class

Multiple elements can have the same class-name set. Elements with a certain class can be targeted/selected via this class-name.

Strings prefixed with a dot `.` are considered class-names in CSS.

m4_embed_php_as_html(html-and-css/class-selector,,.html)

<small>
m4_note([[The elements sharing a class-name can be different tags.]])
</small>

### Combining selectors

If multiple selectors are provided, separated by a comma, `,`, the defined
rules will apply for all the elements matching any of the selectors:

m4_embed_php_as_html(html-and-css/multi-selectors,250px,.html)


CSS selector rules can also be composed out of multiple selectors. This allows for a
more detailed/specific selection.

#### Elements matching multiple rules

```css
selector1.selector2 {}
```

Selectors can be chained concatenated into a longer selection to make the
selection more specific.

For example select only the `p`-tags with a certain class:

m4_embed_php_as_html(html-and-css/selector-chaining,,.html)

In this case `p.classname` means:

* Select all elements with class `classname`
* From all the elements with class `classname`, select all `p`-tags.

You can make these selectors as long and as complex as you want:

`div.class1.class2.class3`...

#### Elements inside another element

```css
selector1 selector2 {}
```
Multiple selectors separated by spaces indicate nesting. The last selector
should be found inside the previous, inside the previous, ...

<small>
m4_note([[Inside in this context means, the element must be wrapped by the other element:

```html
<elem1>
    <elem2>
    </elem2>
</elem2>
```

Is doesn't matter how many other tags are in-between the parent and the nested element:

```html
<elem1>
    <antoher-elem>
        <elem2>
        </elem2>
    </antoher-elem>
</elem2>
```
]])
</small>

m4_embed_php_as_html(html-and-css/selector-nesting,,.html)

m4_note([[If two selectors target the same element and the same property, the
last one encountered takes precedence]])

#### Direct children of an element

```css
selector1 > selector2 {}
```

The `>` symbol between two selectors indicates an direct parent -> child
relationship. By this we mean the second element must be an immediate child of
the first selector. No other tags may warp the child element.

```html
<parent>
    <child>
    </child>
</parent>
```

m4_embed_php_as_html(html-and-css/direct-child-selector,,.html)

#### Siblings

```css
selector1 ~ selector2 {}
```

The `~` symbol between two selectors, selects all the elements that match the
second selector who exist after the first selector and have the same parent.

m4_embed_php_as_html(html-and-css/all-siblings-selector,,.html)

#### Direct siblings

```css
selector1 + selector2 {}
```

The `+` symbol between two selectors, selects the first element that matches
the second selector, is located directly after the first selector and have the
same parent.

m4_embed_php_as_html(html-and-css/direct-siblings-selector,,.html)

### Special selectors

#### last-child

```css
selector:last-child {}
```

This selection modifier targets the last element matching the given selector:

m4_embed_php_as_html(html-and-css/last-child-selector,,.html)

In the example is the div coloured red, the last div in the `.parent` tag.

#### nth-child

```css
select:nth-child( n ... ) {}
```

The `nth-child` modifier targets the elements matching a simple equation where n is the position of the element in the list.

m4_embed_php_as_html(html-and-css/nth-child-selector,,.html)

* `2n + 1`: all odd elements (the `odd` keyword can also be used: `:nth-child(odd)`)
* `2n`: all even elements (the `even` keyword can also be used: `:nth-child(even)`)
* `3`: the third element

## Colours

The appearance of text can be modified heavily via CSS

Colours can be defined in multiple ways:

* Colour name: the most common colours like red, blue, green, yellow,... can be specified via their names.
* RGB notation: `rgb( red-value, green-value, blue-value)`.
* HEX notation: `#RRGGBB` where `RR` is the hexa-deciaml notation of the red value, `GG` for green and `BB` for blue...

See [background](#background) for an example.

## Background

See m4_cssprop(background) for detailed information about the background.

Set the background of an element.

```css
div {

    background: steelblue; /* named colour */
    background: rgb( 70, 130, 180 ); /* Red green and blue value */
    background: #4682B4; /* hexa decimal notation */
}
```

## Font and text.

In depth info about fonts can be found
[here](http://www.w3schools.com/css/css_font.asp) and about text
[here](http://www.w3schools.com/css/css_text.asp).

The appearance of text can be heavily modified:

### Colour

Set the m4_cssprop(color) of the text.

```css
div {

    color: steelblue;
}
```

### Font-family

Set a font.

Specify the most fonts from most desired font first to least desired (and more
generic) font last.

```css
div {
    font-family: "Times New Roman", Times, serif;
}
```

### Font-size

This property determines the m4_cssprop(font)-size of the text.

```
font-size: ( xx-small | x-small | small | medium | large | x-large | xx-large )
font-size: ( smaller | larger )
font-size: <value>
```

The size can be defined as a predefined word/value or as an action.

`smaller` goes a step down in the rank, for example: `small` -> `x-small`.
`larger` goes a step down in the rank, for example: `large` -> `x-large`.

```css
div {

    font-size: 25px;
    font-size: 1.2em;
}
```

* `px`: set the height of the font to this amount o pixels;
* `em`: Set the size of the font relative the its parent:
  For example:
    * `1em`: no changes = 100%
    * `1.5em`: 150% the size of the parent
    * `0.9em`: 90% the size of the parent

### Font-style

```css
font-style: ( normal | italic | oblique | inherit )
```

* `normal`: normal text.
* `italic`: slanted text (a custom designed slanted font set.)
* `oblique`: slanted text (the normal font slanted by software)
* `inherit`: inherit the value from the parent element

```css
div {

    font-style: italic;
}
```

### Font-variant

Visualise the font in all caps. Real capitals are still a bit larger than the
normal letters.

```css
div {

    font-variant: small-caps;
}
```

### Font-weight

Make the font bold or reset the boldness.

```css
font-weight: ( normal | bold | inherit )
```

```css
div {

    font-weight: bold;
}
```

### Text-decoration

This property determines if text is:

* underlined
* line-through
* overlined

### Text-align

Define how the text should be aligned inside an element:

#### Example

m4_embed_php_as_html(html-and-css/font-and-text,250px,.html)

## Border

Draw a border around an element.

```css
border: <style> <color> <width>;
```

Types:

* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset
* none
* hidden


m4_embed_php_as_html(html-and-css/border,,.html)

In depth info about borders can be found [here](http://www.w3schools.com/css/css_border.asp)

## Margin

Sometimes elements stick to close to each other. The margin specifies how far
other elements should stay away from an element

The margin property accepts one, two or four values.

```css
margin: 1px; /* set a margin of 1px for all four sides */
margin: 1px 2px; /* set a margin of 1px for the top and bottom and 2px for the left and right side */
margin: 1px 2px 3px 4px ; /* top: 1px, right side: 2px, bottom: 3px, left side: 4px */
```

m4_embed_php_as_html(html-and-css/margin,230px,.html)

All sides can also be specified separately:

```css
margin-top: 5px;
margin-right: 5px;
margin-bottom: 5px;
margin-left: 5px;
```

In depth info about margins can be found [here](http://www.w3schools.com/css/css_margin.asp)

#### Padding

The padding defines the distance the content inside the element shoud stay away
from its border.

The padding property accepts one, two or four values.

```css
padding: 1px; /* set a padding of 1px for all four sides */
padding: 1px 2px; /* set a padding of 1px for the top and bottom and 2px for the left and right side */
padding: 1px 2px 3px 4px ; /* top: 1px, right side: 2px, bottom: 3px, left side: 4px */
```

m4_embed_php_as_html(html-and-css/padding,230px,.html)

All sides can also be specified separately:

```css
padding-top: 5px;
padding-right: 5px;
padding-bottom: 5px;
padding-left: 5px;
```

In depth info about paddings can be found [here](http://www.w3schools.com/css/css_padding.asp)

#### Box-model

## Exercises