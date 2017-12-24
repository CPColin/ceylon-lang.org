import ceylon.html {
    A,
    I,
    P,
    Span
}

shared {A|P*} followCeylonPartial => {
    A {
        href = "/+";
        style = "cursor:pointer;margin-left:auto;margin-right:auto;display:block;\
                 text-align:center;padding-top:10px;padding-bottom:0px";
        Span {
            style = "display:inline-block;font-weight:bold;vertical-align:top;\
                     margin-right:5px;margin-top:8px;";
            "Follow Ceylon:"
        }
    },
    P {
        style = "cursor:pointer;margin-left:auto;margin-right:auto;margin-top:2px;\
                 display:block;text-align:center;padding-top:0px";
        A {
            href = "/+";
            // Original HTML may have meant to use <img> elements for these.
            I {
                //alt = "Google Plus";
                clazz = "fa fa-google-plus-square fa-2x";
                //height = 32;
                //width = 32;
            }
        },
        " ",
        A {
            href = "http://twitter.com/ceylonlang";
            I {
                //alt = "Twitter";
                clazz = "fa fa-twitter-square fa-2x";
                //height = 32;
                //width = 32;
            }
        },
        " ",
        A {
            href = "https://www.facebook.com/ceylonlang";
            I {
                //alt = "Facebook";
                clazz = "fa fa-facebook-square fa-2x";
                //height = 32;
                //width = 32;
            }
        }
    }
};
