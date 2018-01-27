# Exercise 5

## Objective

Now that we know the basics, let's extend the analysis of the Liquid language to support [control
flow tags](http://shopify.github.io/liquid/tags/control-flow/).

Remember to bring your files from past exercises, you'll need them.

This exercise is a challenge to the reader. If you solve it you should be pretty proud of yourself!

Be sure to let us know! richard.wilson@shopify.com & tomasz.skorupa@shopify.com

We'd be very interested in hearing about your solution.

As usual, the below instruction is available in example input and output files like the past exercises.

## Instructions

Modify the Liquid tokenizer and Liquid analyzer to support ```if-else-endif``` statements.

### Ex. Malformed HTML and wellformed Liquid
Input:
```liquid
<html>
<body>
  <div>
  {% if settings.something %}
  	My content
  </div>
  {% else %}
  	My other content
  {% endif %}
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
