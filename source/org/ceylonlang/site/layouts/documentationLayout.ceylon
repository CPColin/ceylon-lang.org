import ceylon.html {
    Div,
    Html,
    Raw,
    Span
}

import org.ceylonlang.site.pages {
    Page
}
import org.ceylonlang.site.partials {
    currentReleaseLinkPartial
}
import org.ceylonlang.site.util {
    Element
}

object documentationLayout extends Layout() {
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
                             ### [Quick introduction](/documentation/1.0/introduction)
                             ### [Tour of Ceylon](/documentation/1.0/tour)
                             ### [Ceylon Walkthrough](/documentation/1.0/walkthrough)
                             ### [Tutorial videos](/documentation/1.0/videos)
                             ### [Language specification](/documentation/1.0/spec)
                             ### [Reference](/documentation/1.0/reference)
                             ### [Language module API](#{site.urls.apidoc_1_0}/index.html)
                             ### [FAQs](/documentation/1.0/faq)
                             ### [Roadmap](/documentation/1.0/roadmap)
                             ### [Ceylon IDE](/documentation/1.0/ide)"
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
                        "Learn ",
                        Span {
                            style = "color:#8d5e0b";
                            "(1.0)"
                        }
                    }
                },
                Div {
                    id = "core-page";
                    currentReleaseLinkPartial("1.0"),
                    content
                }
            };
}
