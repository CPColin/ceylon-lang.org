import ceylon.html {
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

shared object teamPage extends Page.fromCeylon(
    communityLayout,
    [
        Page.keyTab->"community",
        Page.keyTitle->"The Ceylon team",
        Page.keyUniqueId->"communitypage"
    ],
    H1 {
        "The Ceylon team"
    },
    *expand {
        for (bio in data("team")) {
            H2 {
                id = urlify(bio.name);
                bio.name
            },
            Div {
                clazz = "teammember";
                Div {
                    clazz = "teammemberphoto";
                    Img {
                        src = bio.property(Page.keyPhoto);
                        width = 150;
                        height = 150;
                    }
                },
                Div {
                    clazz = "teammemberbio";
                    bio.elements
                }
            }
        }
    }
) {}
