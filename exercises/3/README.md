# Exercise 3: Analysis

## Objective

Now that we can tokenize and parse liquid templates, it's time to analyze them and detect any errors that might be involved in the parsing of those documents.

In this third exercise, we will make use of the liquid parser from exercise 2 to analyze the generated AST. AND the liquid tokenizer from exercise 1.

**Remember to copy over your files from the last two exercises**

The objective of this exercise is to analyze the generated AST for correctness and to report on any inadequacies detected during tokenization or during parsing.

The goal of this exercise is to detect errors for *non well formed input*

For your convenience, each example and expected output are below, but are included in the example.liquid and example_output.json files.

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

### [Move to bonus exercise 1](../bonus1/README.md)
