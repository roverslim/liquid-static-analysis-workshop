# Exercise 2

### Objective

[TODO]

### Instructions

1. Parse a document containing a wellformed liquid comment block into an AST

#### Input
```liquid
{% comment %}
  This is a comment
{% endcomment %}
```

#### Output
```rb
[
  { type: :comment, body: 'This is a comment\n', wellformed: true },
]
```

2. Parse a document containing a malformed liquid comment block with a missing closing into an AST

#### Input
```liquid
{% comment %}
  This is a comment
<div>
```

#### Output
```rb
[
  { type: :comment, body: 'This is a comment\n<div>', wellformed: false },
]
```

3. Parse a document containing a malformed liquid comment block with a typo in the opening block

#### Input
```liquid
{% coment %}
  This is a comment
{% endcomment %}
```

#### Output
```rb
[]
```
