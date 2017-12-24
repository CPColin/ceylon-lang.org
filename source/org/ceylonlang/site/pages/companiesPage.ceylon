import ceylon.html {
    A,
    Div,
    H1,
    H2,
    Img
}

import org.ceylonlang.site.layouts {
    communityLayout
}
import org.ceylonlang.site.util {
    data,
    urlify
}

shared object companiesPage extends Page.fromCeylon(
    communityLayout,
    [
        Page.keyTab->"community",
        Page.keyTitle->"Companies that contribute to Ceylon",
        Page.keyUniqueId->"communitypage"
    ],
    H1 {
        "Companies that contribute to Ceylon"
    },
    *expand {
        for (company in data("companies")) {
            H2 {
                id = urlify(company.name);
                company.name
            },
            Div {
                clazz = "teammember";
                Div {
                    clazz = "teammemberphoto";
                    A {
                        href = company.property(Page.keyHomePage);
                        title = company.name;
                        Img {
                            src = company.property(Page.keyPhoto);
                            width = 200;
                        }
                    }
                },
                Div {
                    clazz = "teammemberbio";
                    company.elements
                }
            }
        }
    }
) {}
