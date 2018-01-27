# Exercise 1

### Objective

In this first exercise, we will implement a tokenizer for the Liquid template language.

We will focus the implementation to support comment tags as the Liquid language is extensive and we want to move on
towards building a static analyzer quickly. For starters, Liquid tags are identified by ```{%``` and ```%}```. A comment
tag can be identified by an opening tag ```{% comment %}``` and a closing tag ```{% endcomment %}```. Anything contained
within a wellformed comment block will be un-rendered. You can consult the [documentation](http://shopify.github.io/liquid/tags/comment/)
for more information on Liquid comment blocks.

A tokenizer generally does two things:
- it scans incoming strings against a dictionary
- it converts matched strings into tokens

You can consult [wikipedia](https://en.wikipedia.org/wiki/Lexical_analysis) for more information on tokenizers.

### Instructions

Write a tokenizer that takes in strings as input and returns their Liquid representation as tokens.

1.  An opening tag for a comment block ```"{% comment %}" => [:comment, :open]```

2. A closing tag for a comment block ```"{% endcomment %}" => [:comment, :close]```

3. A string containing no liquid template code ```"This is a comment" => nil```

4. (Bonus) An opening comment block tag containing a typo ```"{% coment %}" => nil```

5. (Bonus) A closing comment block tag containing a typo ```"{% endcoment %}" => nil```

### [Move to exercise 2](../2/README.md)
