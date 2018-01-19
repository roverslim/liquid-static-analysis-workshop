# Exercise 3

### Objective

[TODO]

### Instructions

1. Analyze a document containing a wellformed liquid comment block

#### Input
```liquid
{% comment %}
  This is a comment
{% endcomment %}
```

#### Output
```rb
[]
```

2. Analyze a document containing a malformed liquid comment block with a missing closing

#### Input
```liquid
{% comment %}
  This is a comment
<div>
```

#### Output
```rb
[
  { line_number: 1, error: :malformed_tag, message: 'Comment block opened but never closed.' },
]
```

3. Analyze a document containing a malformed liquid comment block with a typo in the opening block

#### Input
```liquid
{% coment %}
  This is a comment
{% endcomment %}
```

#### Output
```rb
[
  { line_number: 1, type: :unknown_tag_type, message: 'Unrecognized tag type "coment".' },
  { line_number: 3, type: :malformed_tag, message: 'Comment block closing without a matching opening.' },
]
```
