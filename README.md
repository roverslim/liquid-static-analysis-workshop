# liquid-static-analysis-workshop
**Topic:** Detect language construct errors in Liquid templates through basic static analysis methods.

**Details:** Learn the basics of static analysis through means of tokenizing and parsing Liquid code.

**Learning style:** A series of exercises that will incrementally result in a static analyzer.


## 1. What is Liquid?

Liquid is an [open source project](https://github.com/Shopify/liquid). It is used as a template language to build web pages.

Liquid code can be categorized into three types:
- *Objects* display content on a page.
- *Filters* modify Liquid objects.
- *Tags* allow for logic and control flow.

In this workshop, we will solely work with Liquid comment tags.

You can consult the [Liquid documentation](http://shopify.github.io/liquid/basics/introduction/) for greater detail.


## 2. What is a static analyzer?

A static analyzer walks through a block of code or on an entire program without ever executing it.

A static analyzer will pinpoint language mistakes in the code. Such a tool is referred to as a linter. Static analysis may reach all
the way to formally prove the correctness of a program through mathematical proofs.

You will find a formal definition, examples and related links on
[wikipedia](https://en.wikipedia.org/wiki/Static_program_analysis).

## 3. Why do we want to statically analyze Liquid templates?

Liquid is used to power Shopify themes. It allows to load dynamic content on storefront pages.

A theme is created, then modified to tailor merchant specifities. Errors, typos and unintended side-effects can creep
in. Rendering every store's page manually is a tedious and error-prone process. Common input errors could be detected
early on, at the build or upload stage, thus avoiding a constant back and forth.

By making use of static analysis to validate the language constructs, we can reduce the surface area to cover in browser
tests.


## 4. What is our static analyzer going to support?

We will limit our static analysis to [Liquid comment tags](http://shopify.github.io/liquid/tags/comment/). We want to
detect typos, missing opening brackets and missing closing brackets.


## 5. How are we going to do it?

Our static analyzer will closely resemble a lint tool. In the first exercise, we will teach it to recognize Liquid tags
from input strings. In the second exercise, we will accumulate the tokenized Liquid tags into an [abstract syntax
tree (AST)](https://en.wikipedia.org/wiki/Abstract_syntax_tree). In the third and final ramp-up exercise, we will analyze the
AST correctness.


### [Get started with exercise 1 :-)](exercises/1/README.md)
