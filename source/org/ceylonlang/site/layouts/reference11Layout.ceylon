import ceylon.html {
    Div,
    Html,
    Raw
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

object reference11Layout extends Layout() {
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
                             ### [Quick introduction](/documentation/1.1/introduction)
                             ### [Tour of Ceylon](/documentation/1.1/tour)
                             ### [Ceylon Walkthrough](/documentation/1.1/walkthrough)
                             <!--  ### [Tutorial Videos](/documentation/1.1/videos) -->
                             ### [Language specification](/documentation/1.1/spec)
                             ### [Reference](/documentation/1.1/reference)"
                        ),
                        page.tableOfContents,
                        Raw(
                            ":markdown
                             ### [Language module API](#{site.urls.apidoc_1_1}/index.html)  
                             ### [FAQs](/documentation/1.1/faq)
                             ### [Roadmap](/documentation/1.1/roadmap)
                             ### [Ceylon IDE](/documentation/1.1/ide)"
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
                        "Reference (1.1)"
                    }
                },
                Div {
                    id = "core-page";
                    currentReleaseLinkPartial("1.1"),
                    // TODO: milestone indicator
                    content
                }
            };
}
