# Exercise 2: parsing

## Objective

In this second exercise, we will extend upon the tokenizer built in exercise 1 and we will implement a stateful construct that the liquid tokens we hand it.

One technique to build upon incoming tokens is to store them in an [abstract syntax tree (AST)](https://en.wikipedia.org/wiki/Abstract_syntax_tree). An AST is just a representation of the langugage constructs in the form of a tree. It will help us categorize the correctness the tokenized input.

## Instructions

1. Tokenize the incoming string.
2. Create a data structure and keep a pointer to it when the token corresponds to an opening comment tag.
3. Mark the data structure in 2 as wellformed when the token corresponds to a comment tag closing.
4. Insert any string content as the data structure body when a comment tag is open.

### Ex.1 Parse a document containing a wellformed liquid comment block into an AST

Input:
```liquid
{% comment %}
  This is a comment
{% endcomment %}
```
Parsed output:
```json
[{
  "type": "comment",
  "body": "This is a comment\n",
  "wellformed": true
}]
```


### Ex.2 Parse a document containing a malformed liquid comment block with a missing closing into an AST

Input:
```liquid
{% comment %}
  This is a comment
<div>
```
Parsed output:
```json
[{
  "type": "comment",
  "body": "This is a comment\n<div>",
  "wellformed": false
}]
```


### Ex.3 Parse a document containing a malformed liquid comment block with a typo in the opening block

Input:
```liquid
{% coment %}
  This is a comment
{% endcomment %}
```
Parsed output:
```json
[]
```

### [Move to exercise 3](../3/README.md)
