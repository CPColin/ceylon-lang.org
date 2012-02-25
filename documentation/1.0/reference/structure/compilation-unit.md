---
layout: reference
title: Compilation Units
tab: documentation
unique_id: docspage
author: Tom Bentley
milestone: Milestone 1
---

# #{page.title}

In Ceylon, a *compilation unit* is a text file with the `.ceylon` filename extension 
written in the Ceylon language which contains one or more of top-level 
declarations.

## Usage 

Here's an example compilation unit in the package `com.example.foo` containing 
three [top-level](#top_level) declarations:

    import com.example.baz{Baz}

    shared interace Foo {
        // ...
    }

    shared class DefaultFoo() satisfies Foo {
        // ...
    }
    
    shared Baz? doFoo(Foo foo) {
        return null;
    }


## Description

Compilation units are a compile-time concept and have no representation or 
role at runtime.

### Declarations

A compilation unit must contain one or more declarations

* [type declarations](../types) (class, interface or object), 
* [method declarations](../method) and
* [attribute declaration](../attribute)

Ceylon does not have Java's restriction on `public` (`shared`) classes having 
to be declared in a source file named after the class name.

### Top level

Any declaration which is contained directly within a compilation unit (that is,
without a parent declaration) is considered a *top-level* declaration. Most 
top level declaration permit nested declarations.

### Source Location

A compilation unit resides in a directory hierarchy 
derived from the name of the package the declarations are being made in. 
For instance the compilation unit(s) for 
declarations in the `com.example.foo` package would be held in a
`com/example/foo` directory (where `/` is the directory separator on the
platform in question). This directory can contain any number of source files 
with arbitrary names. Each source file can contain one or more declarations.
Those declarations will all be in the `com.example.foo` package.

## See also

* [Package](../package)
