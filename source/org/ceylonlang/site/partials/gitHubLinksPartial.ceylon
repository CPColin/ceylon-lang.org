import ceylon.html {
    A,
    Div
}

import org.ceylonlang.site.pages {
    Page
}

shared Div gitHubLinksPartial(Page page)
        => Div {
            clazz = "gh-edit";
            A {
                href = "https://github.com/eclipse/ceylon-lang.org/blob/master/``page.path``";
                "View source"
            },
            if (page.gitHubEditable else true)
            then {
                    " | ",
                    A {
                        href = "https://github.com/eclipse/ceylon-lang.org/edit/master/``page.path``";
                        "Edit"
                    }
                }
            else null
        };
