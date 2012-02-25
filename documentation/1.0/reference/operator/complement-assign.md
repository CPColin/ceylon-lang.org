---
layout: reference
title: `~=` (complement assign) operator
tab: documentation
unique_id: docspage
author: Tom Bentley
milestone: Milestone 2
---

# #{page.title}

The right-associative, binary `~=` operator is used to compute the 
*complement* of its left-hand operand in its right-hand operand, assigning the 
result to the left-hand operand. 

## Usage 

    Set<T> a;
    Set<T> b;
    // Code initializing a and b
    Set<T> aExceptB = a~b;

## Description


### Definition

The `~` operator is defined as follows:

    lhs := lhs~rhs

See the [language specification](#{site.urls.spec}#slotwise) for 
more details.

### Polymorphism

The `~=` operator is [polymorphic](/documentation/reference/operator/operator-polymorphism).

The `~` in the definition is the [complement in](../complement-in) operator 
which depends on the [`Slots`](#{site.urls.apidoc}/ceylon/language/interface_Slots.html) interface.

### Meaning of *complement assign* for built-in types

TODO

## See also

* [unary `~`](../complement) (complement) operator
* [binary `~`](../complement-in) (complement in) operator
* [`Slots`](#{site.urls.apidoc}/ceylon/language/interface_Slots.html)
* [slotwise operators](#{site.urls.spec}#slotwise) in the 
  language specification
* [operator precedence](#{site.urls.spec}#operatorprecedence) in the 
  language specification
* [Operator polymorphism](/documentation/tour/language-module/#operator_polymorphism) 
  and the
  [Slots Interface](/documentation/tour/language-module/#the_slots_interface) 
  in the Tour of Ceylon

