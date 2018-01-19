# Exercise 1

### Objective

[TODO]

### Instructions

Write a tokenizer that takes in strings as input and returns their Liquid representation.

1.  An opening tag for a comment block ```"{% comment %}" => [:comment, :open]```

2. A closing tag for a comment block ```"{% endcomment %}" => [:comment, :close]```

3. A string containing no liquid template code ```"This is a comment" => nil```

4. (Bonus) An opening comment block tag containing a typo ```"{% coment %}" => nil```

5. (Bonus) A closing comment block tag containing a typo ```"{% endcoment %}" => nil```
