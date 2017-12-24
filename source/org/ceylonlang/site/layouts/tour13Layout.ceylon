import ceylon.html {
    Div,
    Html,
    Raw
}

import org.ceylonlang.site.pages {
    Page,
    sitemap
}
import org.ceylonlang.site.partials {
    gitHubLinksPartial
}
import org.ceylonlang.site.util {
    Element
}

object tour13Layout extends Layout({
    sitemap.keyChangeFrequency -> "monthly",
    sitemap.keyPriority -> "0.95"
}) {
    shared actual Html layout(Page page, {Element*} content)
            => defaultLayout.layout {
                page = page;
                Div {
                    id = "sidebar";
                    Div {
                        clazz = "point-dark-top";
                        "\{NO-BREAK SPACE}"
                    },
                    Div {
                        clazz = "sidebar-dark";
                        Raw(
                            ":markdown
                             ### [Quick introduction](/documentation/1.3/introduction)
                             ### [Tour of Ceylon](/documentation/1.3/tour)
                             
                             1. [Basics](/documentation/1.3/tour/basics)
                             1. [Classes](/documentation/1.3/tour/classes)
                             1. [Attributes and variables, control structures](/documentation/1.3/tour/attributes-control-structures)
                             1. [Inheritance, refinement, and interfaces](/documentation/1.3/tour/inheritance)
                             1. [Anonymous and member classes](/documentation/1.3/tour/anonymous-member-classes)
                             1. [Streams, sequences, and tuples](/documentation/1.3/tour/sequences)
                             1. [Type aliases and type inference](/documentation/1.3/tour/typeinference)
                             1. [Union, intersection, and enumerated types](/documentation/1.3/tour/types)
                             1. [Generics](/documentation/1.3/tour/generics)
                             1. [Packages and modules](/documentation/1.3/tour/modules)
                             1. [Functions](/documentation/1.3/tour/functions)
                             1. [Named arguments](/documentation/1.3/tour/named-arguments)
                             1. [Comprehensions](/documentation/1.3/tour/comprehensions)
                             1. [Language module](/documentation/1.3/tour/language-module)
                             1. [Initialization and constructors](/documentation/1.3/tour/initialization)
                             1. [Annotations and the metamodel](/documentation/1.3/tour/annotations)
                             1. [Interoperation with Java](/documentation/1.3/tour/interop)
                             1. [Dynamic typing and interoperation with JavaScript](/documentation/1.3/tour/dynamic)
                             
                             ### [Ceylon Walkthrough](/documentation/1.3/walkthrough)
                             ### [Examples](/documentation/1.3/examples)
                             <!-- ### [Tutorial videos](/documentation/1.3/videos) -->
                             ### [Language specification](/documentation/1.3/spec)
                             ### [Reference](/documentation/1.3/reference)
                             ### [Language module API](#{site.urls.apidoc_1_3}/index.html)  
                             ### [FAQs](/documentation/1.3/faq)
                             ### [Roadmap](/documentation/1.3/roadmap)
                             ### [Ceylon IDE for IntelliJ](/documentation/1.3/ide/intellij)
                             ### [Ceylon IDE for Eclipse](/documentation/1.3/ide/eclipse)
                             ### [Vert.x](http://vertx.io/docs/vertx-core/ceylon/)"
                        )
                    },
                    Div {
                        clazz = "point-dark-bottom";
                        "\{NO-BREAK SPACE}"
                    },
                    Div {
                        clazz = "point-light-top";
                    },
                    Div {
                        clazz = "toc";
                        page.tableOfContents
                    },
                    Div {
                        clazz = "point-light-end";
                    }
                },
                Div {
                    id = "banner";
                    Div {
                        id = "text";
                        "Tour of Ceylon"
                    }
                },
                Div {
                    id = "core-page";
                    gitHubLinksPartial(page),
                    content
                }
            };
}
