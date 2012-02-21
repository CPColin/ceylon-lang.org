---
layout: reference
title: `>` (greater than) operator
tab: documentation
unique_id: docspage
author: Tom Bentley
milestone: Milestone 1
---

# #{page.title}

The non-associating, binary `>` operator is used to test whether its left-hand 
operand is *greater than* its right-hand operand

## Usage 

    Comparable<T> x;
    T y;
    Boolean more = x > y;

## Description

### Definition

The `>` operator is defined as follows:

    lhs.greaterThan(rhs);

See the [language specification](#{site.urls.spec}#equalitycomparison) for more details.

### Polymorphism

The `>` operator is [polymorphic](/documentation/reference/operator/operator-polymorphism). 
The meaning of `>` depends on the 
[`Comparable`](#{site.urls.apidoc}/ceylon/language/interface_Comparable.html) interface.

## See also

* API documentation for [`Comparable`](#{site.urls.apidoc}/ceylon/language/interface_Comparable.html)
* [`>` in the language specification](#{site.urls.spec}#equalitycomparison)
* [operator precedence](#{site.urls.spec}#operatorprecedence) in the 
  language specification
* [Operator polymorphism](/documentation/tour/language-module/#operator_polymorphism) 
  in the Tour of Ceylon

