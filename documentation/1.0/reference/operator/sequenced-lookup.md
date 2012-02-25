---
layout: reference
title: `[]` (sequenced lookup) operator
tab: documentation
unique_id: docspage
author: Tom Bentley
milestone: Milestone 1
---

# #{page.title}

The *sequenced lookup* operator accesses several elements in a 
[`Correspondence`](#{site.urls.apidoc}/ceylon/language/interface_Correspondence.html) 
using a 
[`Sequence`](#{site.urls.apidoc}/ceylon/language/interface_Sequence.html).

## Usage 

    String[] names = {"foo", "bar", "baz"};
    String[] firstAndLast = names[{0, 2}];

## Description

Unlike the plain [lookup](../lookup) operator, the *sequenced lookup* operator
allows lookup up several items in one go, returning a `Sequence` of the items.

### Definition

The `[]` operator is defined as follows:

    lhs.items(index)

See the [language specification](#{site.urls.spec}#listmap) for 
more details.

### Polymorphism

The `[]` operator is [polymorphic](/documentation/reference/operator/operator-polymorphism). 
The meaning of `[]` depends on the 
[`Correspondence`](#{site.urls.apidoc}/ceylon/language/interface_Correspondence.html) 
interface.

## See also

* [`[]` (lookup)](../lookup) operator used for accessesing a single item
* [`[]` (iterated lookup)](../iterated-lookup) operator used for accessesing several items using an iterable
* API documentation for [`Correspondence`](#{site.urls.apidoc}/ceylon/language/interface_Correspondence.html)
* [sequence operators](#{site.urls.spec}#listmap) in the 
  language specification
* [operator precedence](#{site.urls.spec}#operatorprecedence) in the 
  language specification
* [Operator polymorphism](/documentation/tour/language-module/#operator_polymorphism) 
  in the Tour of Ceylon

