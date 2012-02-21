---
layout: reference
title: `&&` (and) operator
tab: documentation
unique_id: docspage
author: Tom Bentley
milestone: Milestone 1
---

# #{page.title}

The left-associative, binary `&&` operator is used to compute the 
logical *and* of two operands

## Usage 

    Boolean false_ = true && false;

## Description

### Definition

The `&&` operator is defined as:

    if (lhs) rhs else false

See the [language specification](#{site.urls.spec}#logical) for 
more details.

### Polymorphism

The `&&` operator is not [polymorphic](/documentation/reference/operator/operator-polymorphism).

## See also

* [logical operators](#{site.urls.spec}#logical) in the 
  language specification
* [operator precedence](#{site.urls.spec}#operatorprecedence) in the 
  language specification

