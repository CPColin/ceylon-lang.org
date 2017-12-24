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
    currentReleaseLinkPartial,
    gitHubLinksPartial
}
import org.ceylonlang.site.util {
    Element
}

object tour12Layout extends Layout({
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
                             ### [Quick introduction](/documentation/1.2/introduction)
                             ### [Tour of Ceylon](/documentation/1.2/tour)
                             
                             1. [Basics](/documentation/1.2/tour/basics)
                             1. [Classes](/documentation/1.2/tour/classes)
                             1. [Attributes and variables, control structures](/documentation/1.2/tour/attributes-control-structures)
                             1. [Inheritance, refinement, and interfaces](/documentation/1.2/tour/inheritance)
                             1. [Anonymous and member classes](/documentation/1.2/tour/anonymous-member-classes)
                             1. [Streams, sequences, and tuples](/documentation/1.2/tour/sequences)
                             1. [Type aliases and type inference](/documentation/1.2/tour/typeinference)
                             1. [Union, intersection, and enumerated types](/documentation/1.2/tour/types)
                             1. [Generics](/documentation/1.2/tour/generics)
                             1. [Packages and modules](/documentation/1.2/tour/modules)
                             1. [Functions](/documentation/1.2/tour/functions)
                             1. [Named arguments](/documentation/1.2/tour/named-arguments)
                             1. [Comprehensions](/documentation/1.2/tour/comprehensions)
                             1. [Language module](/documentation/1.2/tour/language-module)
                             1. [Initialization and constructors](/documentation/1.2/tour/initialization)
                             1. [Annotations and the metamodel](/documentation/1.2/tour/annotations)
                             1. [Interoperation with Java](/documentation/1.2/tour/interop)
                             1. [Dynamic typing](/documentation/1.2/tour/dynamic)
                             
                             ### [Ceylon Walkthrough](/documentation/1.2/walkthrough)
                             ### [Examples](/documentation/1.2/examples)
                             <!-- ### [Tutorial videos](/documentation/1.2/videos) -->
                             ### [Language specification](/documentation/1.2/spec)
                             ### [Reference](/documentation/1.2/reference)
                             ### [Language module API](#{site.urls.apidoc_1_2}/index.html)
                             ### [FAQs](/documentation/1.2/faq)
                             ### [Roadmap](/documentation/1.2/roadmap)
                             ### [Ceylon IDE](/documentation/1.2/ide)"
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
                    currentReleaseLinkPartial("1.2"),
                    gitHubLinksPartial(page),
                    content
                }
            };
}
