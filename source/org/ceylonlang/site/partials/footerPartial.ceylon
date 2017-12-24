import ceylon.html {
    A,
    Div,
    Img,
    P,
    Span
}
import ceylon.time {
    now
}

import org.ceylonlang.site.util {
    generateDate
}

shared Div footerPartial
        => let (generateYear = now().dateTime().year)
            Div {
                id = "footer";
                Div {
                    id = "footer-core";
                    Div {
                        id = "sponsor";
                        A {
                            href = "http://www.eclipse.org";
                            title = "Eclipse Ceylon is an Eclipse Project";
                            Img {
                                src = "/images/Eclipse2014_RGB.svg";
                                // Original HTML uses "150px" here.
                                width = 150;
                            }
                        },
                        "\n",
                        Span {
                            "Eclipse Ceylon is an ",
                            A {
                                href = "http://www.eclipse.org";
                                "Eclipse Project"
                            },
                            "."
                        }
                    },
                    Div {
                        id = "copyright";
                        P {
                            id = "copyright_©_2010_``generateYear``_red...";
                            ":markdown
                             Copyright © 2010-``generateYear``, 
                             Red Hat, Inc. or third-party contributors —
                             Ceylon is a trademark of the [Eclipse Foundation](http://www.eclipse.org) — 
                             [Terms of use](https://eclipse.org/legal/termsofuse.php) — 
                             [Privacy policy](https://eclipse.org/legal/privacy.php) — 
                             [Copyright agent](http://www.eclipse.org/legal/copyright.php) — 
                             [Legal](http://www.eclipse.org/legal)."
                        },
                        P {
                            id = "site_generated_on...";
                            "Site generated on ``generateDate``"
                        }
                    }
                }
            };
