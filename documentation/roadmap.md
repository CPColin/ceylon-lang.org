---
layout: documentation
title: Ceylon roadmap
tab: documentation
unique_id: docspage
author: Emmanuel Bernard
---
# #{page.title}

Ceylon code is released and available on [GitHub](http://github.com/ceylon). 

Milestone 1 of Ceylon [has been released](/download) and we are working on milestone 2 
at the moment. Because quality is important to us, we won't release work until we think 
it's usable. Therefore, we can't give you dates on each milestone.

However, our roadmap is quite well-defined:

- Ceylon 1.0
  - [Milestone 1](#milestone_1) (latest release)
  - [Milestone 2](#milestone_2)
  - [Milestone 3](#milestone_3)
  - [Milestone 4](#milestone_4)
  - [Milestone 5](#milestone_5_ceylon_10)
- [Ceylon 1.1](#ceylon_11_or_later)

## Milestone 1

Milestone 1 has been released.

*Expressions, basic procedural code, basic object orientation, 
basic generics including variance, validation of definite
assignment/initialization and definite return, exceptions,
modularity.*

### Declarations:
* toplevel classes
* toplevel interfaces (except concrete members)
* toplevel methods (no higher-order or first-class functions)
* toplevel simple attributes
* toplevel attribute getters
* toplevel anonymous classes (`object` declaration)
* member methods with blocks (no higher-order methods)
* member simple attributes
* member attribute getters/setters
* member anonymous classes (`object` declaration)
* locals
* nested methods (closures)
* nested getters/setters
* nested anonymous classes
* nested classes
* type inference with `value` and `function`
* inheritance (`satisfies` and `extends`)
* `abstract` classes
* `formal` members
* method / attribute refinement (`default`, `actual`)

### Statements:
* expression statements
* specification statements
* control structures excluding `switch/case`<a href="#m1-control"><sup>1</sup></a>
* `if (exists ... )`
* `if (nonempty ... )`
* `if (is ...)`

### Generics:
* generic types 
* generic methods
* covariance / contravariance (`in`/`out`) [TODO: extra tests]
* upper bounds
* type argument inference [TODO: compiler ignores inferred type arguments]

### Expressions:
* literals (except single-quoted literals)
* string templates (interpolation)
* self references (`this`, `super`) 
* attribute evaluation/assignment
* operators <a href="#m1-operators"><sup>2</sup></a>
* parenthesized expressions
* positional method invocation<a href="#m1-invocation"><sup>3</sup></a>
* named-argument method invocation (no object/method/getter args)<a href="#m1-invocation"><sup>3</sup></a>
* instantiation<a href="#m1-invocation"><sup>3</sup></a>
* sequence instantiation `{ x, z, y}`
* invocations with type arguments
* assignment

### Misc:
* union types `A|B`
* intersection types `A&B`
* type name abbreviations `T[]` and `T?`
* imports
* initialization/declaration section rules [TODO: check this against latest spec]
* definite assignment/initialization rules
* definite return rules
* methods/attributes with named arguments
* `shared` members + visibility rules
* local capture [TODO: test and bugfix capture of forward declared locals]
* erasure of `Void`/`Object`/`Nothing`/`Equality`/`IdentifiableObject`
* optimization of locals in class initializer
* sequenced (varargs) parameters
* optimization of primitives with auto(un)boxing
* defaulted parameters [TODO: bugfixes]

### Types:
* `Boolean`
* `Character` and `String`
* numeric types
* sequences
* `Comparison`
* `Entry`
* `Range`
* `process`

### Modularity:
* module and package descriptors
* `car` archives
* local repositories
* module versioning
* module runtime

Notes:

1. <a name="m1-control">Without support for `try (x)` or `if (satisfies U V)`.</a>
2. <a name="m1-operators">Excluding slotwise operators, and operators that depend 
   on `Gettable`/`Callable`. Furthermore, *numeric widening* with arithmetic 
   operators and user-defined numeric types is not supported.</a>
3. <a name="m1-invocation">Excluding defaulted arguments and `Callable`.</a>

## Milestone 2

*Numeric type optimization, Java interop, `switch/case`, 
types with enumerated cases, remote repositories.*

### Declarations:
* cases (`of` clause)

### Generics:
* enumerated bounds

### Statements:
* `switch/case`

### Misc:
* optimization of primitive operators
* Java interoperability
* exhaustive case lists

### Types:
* `Collection`, `List`, `Map`, `Set`

### Modularity:
* remote repositores
* `modules.ceylon-lang.org`
* repository replicator

## Milestone 3

*Higher-order and first-class functions, file IO.*

### Declarations:
* higher-order methods
* methods with specifiers

### Expressions:
* method references
* object/method/getter args in named argument lists
* anonymous functions in positional argument lists
* comprehensions as sequenced arguments
* numeric widening for custom numeric types ?

### Modules:
* `ceylon.io` module
* `ceylon.math` module

## Milestone 4

*Mixin inheritance, nested/member classes, type aliases.*

### Declarations:
* class and interface aliases
* nested and member classes
* concrete interface members

### Statements:
* `try` with resources

### Expressions:
* outer instance references (`outer`)
* slotwise operators

## Milestone 5 (Ceylon 1.0)

*Annotations, reified generics, metamodel, interception.*

### Declarations:
* annotations

### Generics:
* sequenced type parameters
* reified generics

### Expressions:
* metamodel references

### Misc:
* annotation constraints
* interception for methods, attributes, and classes

### Modules:
* metamodel

## Ceylon 1.1 or later

* introductions (`adapts` clause)
* lower bounds
* initialization parameter specification
* `if (satisfies ...)`
* `satisfies` and `extends` operators
* inline callable arguments
* control expressions?
* single-quoted literals

