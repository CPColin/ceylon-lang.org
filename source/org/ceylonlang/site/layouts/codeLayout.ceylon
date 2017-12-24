import ceylon.html {
    Div,
    Html
}

import org.ceylonlang.site.pages {
    Page,
    sitemap
}
import org.ceylonlang.site.util {
    Element
}

object codeLayout extends Layout({
    sitemap.keyPriority -> "0.6"
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
                        ":markdown
                         ### [Licenses](/code/licenses)
                         ### [Nightly builds](https://ci-ceylon.rhcloud.com/)
                         ### [Get the source](/code/source)
                         ### [Contribute](/code/contribute)
                         ### [Improve the website](/code/website)
                         ### [Report a bug](/code/issues)"
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
                        "Code"
                    }
                },
                Div {
                    id = "core-page";
                    content
                }
            };
}
