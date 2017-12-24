import ceylon.html {
    Div,
    Html
}

import org.ceylonlang.site.pages {
    Page
}
import org.ceylonlang.site.partials {
    followCeylonPartial
}
import org.ceylonlang.site.util {
    Element
}

shared object communityLayout extends Layout() {
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
                         ### [User forum](http://groups.google.com/group/ceylon-users)
                         ### [Ceylon Tour Conference](/community/conferences/ceylon-tour-paris-2014)
                         ### [Events](/community/events)
                         ### [Dev mailing list](http://groups.google.com/group/ceylon-dev)
                         ### [Team](/community/team)
                         ### [Articles](/community/articles)
                         ### [Presentations](/community/presentations)
                         ### [Companies behind Ceylon](/community/companies)"
                    },
                    Div {
                        clazz = "point-dark-end";
                        "\{NO-BREAK SPACE}"
                    },
                    followCeylonPartial
                },
                Div {
                    id = "banner";
                    Div {
                        id = "text";
                        "Community"
                    }
                },
                Div {
                    id = "core-page";
                    content
                }
            };
}
