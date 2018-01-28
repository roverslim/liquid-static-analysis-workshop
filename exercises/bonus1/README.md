# Bonus exercise 1

## Objective

In the previous exercises, we saw how to tokenize a string, parse it into a language construct and analyze the result.

This time around, we will extend the analysis to support a full blown html and liquid template. We're still going to be primarily testing the analysis portion here, so no errors means we have a wellformed document.

This should be understood as a challenge to the reader. We haven't provided a solution to you, let us know if you finish it :)

For your convenience, the examples below have been extracted into example.liquid and example.json files in the repository for your testing.

## Instructions

1. Write an html tokenizer and parser that handle html, body and div tags.
2. Have each line of the code snippet go through the liquid tokenizer then the html parser before being parsed.
3. Analyze the output.

### Ex.1 Wellformed HTML and wellformed Liquid
Input:
```liquid
<html>
<body>
  <div>
    My content
    {% comment %}
      </div>
    {% endcomment %}
  </div>
</body>
</html>
```
Analyzed output:
```json
[]
```

### Ex.2 Malformed HTML and wellformed Liquid
Input:
```liquid
<html>
<body>
  <div>
    My content
    {% comment %}
  </div>
    {% endcomment %}
</body>
</html>
```
Analyzed output:
```json
[{
  "line_number": 3,
  "parser": "html",
  "error": "malformed_tag",
  "message": "div opened but never closed."
}]
```

### Ex.3 Wellformed HTML and malformed Liquid
Input:
```liquid
<html>
<body>
  <div>
    My content
    {% comment %}
      This is a comment.
    {% comment %}
  </div>
</body>
</html>
```
Analyzed output:
```json
[{
  "line_number": 3,
  "parser": "liquid",
  "error": "malformed_tag",
  "message": "Comment block opened but never closed."
}]
```

### [Move to bonus exercise 2](../bonus2/README.md)
