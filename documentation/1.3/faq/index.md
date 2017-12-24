---
title: FAQs 
layout: faq13
toc: true
tab: documentation
unique_id: docspage
author: Emmanuel Bernard
---

# Frequently Asked Questions

On this page you'll find answers to a few of the most common 
questions about the Ceylon project.  

<toc>

## Basics

### What is Ceylon?

Ceylon is a new programming language that's deeply influenced 
by Java, designed by people who are unapologetic fans of Java. 
It's a language designed for writing large programs in teams.

In line with this purpose, Ceylon is a language which offers 
disciplined static typing, built-in modularity, and excellent
tooling.

It's also an extremely elegant language, and highly readable.

### Where can I run Ceylon?

You can run Ceylon anywhere a Java 7 or 8 Virtual Machine is 
available. The Ceylon compiler uses the bytecode generator 
in Open JDK to produce Java bytecode. Ceylon modules even
run on Vert.x or in any OSGi container.

You can also run Ceylon programs on a JavaScript virtual 
machine, for example, in a web browser or on Node.js. 

Note that not all Ceylon modules are available for both 
platforms. A module might be cross-platform, it might by 
JVM-only, or it might be JavaScript-only. Of course, 
`ceylon.language` is completely cross-platform.

### Why a new language?

Well, we've been designing and building frameworks and 
libraries for Java for well over a decade, and we know its 
limitations intimately. The most recent releases of Java go 
some distance to alleviating _some_ problems, but even the 
newest language features strain to accommodate past mistakes 
and the requirement for full backward compatibility.

### How is Ceylon different?

Every language has its strengths and weaknesses. Ceylon is a 
great language if you want to create easily understandable
and maintainable code with minimum fuss, especially if you
like navigating and writing code with the help of an IDE. 
It's also an especially great language if you care about 
modularity.

There are [five important concerns](/blog/2012/01/10/goals/)
that guide the design of the language and platform.

### But there's already so many languages out there!

Well, sure, but how many of them actually meet the bare list 
of technical requirements we have here: cross-platform 
execution, modularity, great tooling? The requirement for 
tooling alone rules out _all dynamically typed languages_. 
And the requirement for execution on JavaScript VMs rules out 
essentially all the rest. In fact, I can't really name another 
existing language that, as of today, even arguably has the 
same set of technical capabilities as Ceylon. And that's 
without even getting started on any of 
[our other goals and principles](/blog/2012/01/10/goals).

If you're not convinced, we've written a longer post on 
[why you might want to choose Ceylon](/blog/2015/10/27/why/). 

### How about Java interoperability?

Java interoperability is a critically important feature of 
the language. You can use the Java SDK and other Java 
libraries directly from Ceylon. This gives Ceylon programs 
immediate access to a huge ecosystem of reusable functionality.

On the other hand, Ceylon has its own, cleaner, modular SDK, 
and, since code written to depend on the Java SDK can't execute 
on a JavaScript virtual machine, Ceylon will sometimes benefit 
from frameworks designed especially for Ceylon. That's 
reasonable, since Ceylon is a _very_ comfortable language 
for development of frameworks and libraries!

You can learn more about interoperation with Java 
[right here](../tour/interop/).

### And interoperation with JavaScript?

The Ceylon language features several constructs that exist 
to support interoperation with languages with dynamic typing,
primarily with JavaScript:

- `dynamic` blocks make it possible to write and interoperate
  with dynamically typed code in Ceylon,
- a `dynamic` instantiation expression lets you create an
  untyped JavaScript object in Ceylon, and
- `dynamic` interfaces allow us to ascribe static types to
  pre-existing dynamically-typed JavaScript APIs.

You can learn more `dynamic` [here](../tour/dynamic).

### Where can I read more about some of your language design choices?

Try the [language design FAQ](language-design).

## The project and team

### Who's behind this project?

Ceylon is a community project sponsored by Red Hat. You can
read more about the team [here](/community/team/).

### How is Ceylon pronounced?

There's some debate about that but the accepted pronunciation 
in the team is [/sɨˈlɒn/](http://en.wikipedia.org/wiki/Wikipedia:IPA_for_English#Key).
Or in less fancy schmancy phoneticsy, `selón`. 

(On the other hand, lots of folks seem to pronounce it 
`say-lon` with the emphasis on the first syllable so if you 
say it like that we'll probably know what you're talking 
about.) 

### Where can I read some user's opinions of Ceylon?

We're collecting links to [articles about Ceylon](/community/articles).

## Contributing

### How can I contribute to Ceylon?

Are you interested in joining the team and helping improve 
the Ceylon language, the compiler, the class libraries, or 
the IDE? Then contact us on our 
[dev mailing list](http://groups.google.com/group/ceylon-dev).

Want to get your hands on the code? Read how to access 
[the source](/code/source/).

Feeling adventurous and want to help us with the compiler 
backend? Read about [how to work on that project](/code).

### Found a problem, how can I improve the website?

The website is fully open and you can easily contribute 
typos, improvements, or new pages [very easily](/code/website). 

## Technical

### What version of Java is required to run Ceylon?

Both Ceylon and Ceylon IDE for Eclipse require Java 7 or Java 8.

### Can you tell me more about how it works?

You can read up on the [architecture](/code/architecture).

### Can I use a profiler with Ceylon?

Yes you can, at least on the JVM, like any other Java program. If your code runs using JBoss Modules (the
default for `ceylon run`) then you may have to use the `--define jboss.modules.system.pkgs=com.yourkit` runtime
flag if you use YourKit.

## Other

### What license is Ceylon released under?

All the code, the language specification, and even our website 
is [open source](/code/licenses). It's extremely important to 
us that the entire platform be open and unencumbered.

### What is the naming convention for Ceylon platform releases?

Ceylon production releases are named after Minds from the late 
great Iain M. Banks' Culture series.

### Am I allowed to say "ceylonish"?

No, the correct term is "ceylonic".

### What is the elephant's name?

His name is "Trompon".
