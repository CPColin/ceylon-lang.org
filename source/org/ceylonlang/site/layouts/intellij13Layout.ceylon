import ceylon.html {
    Div,
    Html,
    Raw
}

import org.ceylonlang.site.pages {
    Page,
    sitemap
}
import org.ceylonlang.site.util {
    Element
}

object intellij13Layout extends Layout({
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
                             ### [Ceylon Walkthrough](/documentation/1.3/walkthrough)
                             ### [Examples](/documentation/1.3/examples)
                             <!--  ### [Tutorial videos](/documentation/1.3/videos) -->
                             ### [Language specification](/documentation/1.3/spec)
                             ### [Reference](/documentation/1.3/reference)
                             ### [Language module API](#{site.urls.apidoc_1_3}/index.html)  
                             ### [FAQs](/documentation/1.3/faq)
                             ### [Roadmap](/documentation/1.3/roadmap)
                             ### [Ceylon IDE for IntelliJ](/documentation/1.3/ide/intellij)
                             
                             * [Features](/documentation/1.3/ide/intellij/features)
                             * [Installation](/documentation/1.3/ide/intellij/install)
                             * [Getting started](/documentation/1.3/ide/intellij/getting-started)
                             
                             ### [Ceylon IDE for Eclipse](/documentation/1.3/ide/eclipse)
                             ### [Vert.x](http://vertx.io/docs/vertx-core/ceylon/)"
                        )
                    },
                    Div {
                        clazz = "point-dark-end";
                        "\{NO-BREAK SPACE}"
                    }
                },
                Div {
                    id = "banner";
                    Div {
                        id = "text";
                        "Learn"
                    }
                },
                Div {
                    id = "core-page";
                    content
                }
            };
}
