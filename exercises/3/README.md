# Exercise 3: analyzing

## Objective

In this third exercise, we will make use of the liquid parser from exercise 2 to analyze the generated AST.

The objective of this exercise is to analyze the generated AST for correctness and to report on any inadequacies detected during tokenization or during parsing.

## Instructions

1. Build an analyzer that stores a structure for line analysis. It will be called from the tokenizer and the parser to add analysis points.
2. Modify the tokenizer to accept an analysis object and extend it to add analysis points.
3. Modify the parser as in point 2

### Ex.1 Analyze a document containing a wellformed liquid comment block

Input:
```liquid
{% comment %}
  This is a comment
{% endcomment %}
```
Analyzed output:
```json
[]
```


### Ex.2 Analyze a document containing a malformed liquid comment block with a missing closing

Input:
```liquid
{% comment %}
  This is a comment
<div>
```
Analyzed output:
```json
[{
  "line_number": 1,
  "error": "malformed_tag",
  "message": "Comment block opened but never closed."
}]
```


### Ex.3 Analyze a document containing a malformed liquid comment block with a typo in the opening block

Input:
```liquid
{% coment %}
  This is a comment
{% endcomment %}
```
Analyzed output:
```json
[
  {
    "line_number": 1,
    "error": "unknown_tag_type",
    "message": "Unrecognized tag type 'coment'."
  },
  {
    "line_number": 3,
    "error": "malformed_tag",
    "message": "Comment block closing without a matching opening."
  },
]
```

### [Move to exercise 4](../4/README.md)
