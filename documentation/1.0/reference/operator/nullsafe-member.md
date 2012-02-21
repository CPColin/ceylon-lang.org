---
layout: reference
title: `?.` (null-safe member) operator
tab: documentation
unique_id: docspage
author: Tom Bentley
milestone: Milestone 1
---

# #{page.title}

The left-associative, binary `?.` operator is used to access a member if
the its right-hand operand is not `null`.

## Usage 

    Number? num;
    Integer int = num?.positiveValue;

## Description

### Definition

The meaning of `?.` is defined as follows:

    if (exists lhs) lhs.member else null	

### Polymorphism

The `?.` operator is not [polymorphic](/documentation/reference/operator/operator-polymorphism). 

## See also

* [`?` (default)](../default) operator
* [`?.`](#{site.urls.spec}#nullvalues) in the language specification.
* [operator precedence](#{site.urls.spec}#operatorprecedence) in the 
  language specification
