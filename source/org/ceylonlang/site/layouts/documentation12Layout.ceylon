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
    currentReleaseLinkPartial
}
import org.ceylonlang.site.util {
    Element
}

object documentation12Layout extends Layout({
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
                             ### [Ceylon Walkthrough](/documentation/1.2/walkthrough)
                             ### [Examples](/documentation/1.2/examples)
                             <!--  ### [Tutorial videos](/documentation/1.2/videos) -->
                             ### [Language specification](/documentation/1.2/spec)
                             ### [Reference](/documentation/1.2/reference)
                             ### [Language module API](#{site.urls.apidoc_1_2}/index.html)
                             ### [FAQs](/documentation/1.2/faq)
                             ### [Roadmap](/documentation/1.2/roadmap)
                             ### [Ceylon IDE](/documentation/1.2/ide)"
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
                    currentReleaseLinkPartial("1.2"),
                    content
                }
            };
}
