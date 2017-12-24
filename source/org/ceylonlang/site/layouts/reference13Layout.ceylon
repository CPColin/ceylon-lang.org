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

object reference13Layout extends Layout({
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
                             <!--  ### [Tutorial Videos](/documentation/1.3/videos) -->
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
                        "Reference"
                    }
                },
                Div {
                    id = "core-page";
                    gitHubLinksPartial(page),
                    // TODO: milestone indicator
                    content
                }
            };
}
