import ceylon.html {
    A,
    Code,
    Comment,
    Div,
    H1,
    Html,
    Li,
    P,
    Pre,
    Ul
}

import org.ceylonlang.site.pages {
    Page,
    sitemap
}
import org.ceylonlang.site.partials {
    footerPartial
}
import org.ceylonlang.site.util {
    Element
}

shared object homeLayout extends Layout({
    sitemap.keyChangeFrequency -> "monthly",
    sitemap.keyPriority -> "0.75"
}) {
    shared actual Html layout(Page page, {Element*} content)
            => baseLayout.layout {
                page = page;
                Div {
                    clazz = "header-bar";
                    Comment("/cannot use a partial as it loses the page.tab context :("),
                    Div {
                        id = "header";
                        A {
                            href = "/";
                            id = "header-logo";
                            H1 {
                                id = "ceylon";
                                "Ceylon"
                            }
                        },
                        Div {
                            id = "header-tagline";
                            P {
                                id = "say_more_more_clearly";
                                "Say more, more clearly"
                            }
                        },
                        Div {
                            id = "menu";
                            Ul {
                                id = "menu-core";
                                Li {
                                    id = tabId(page, "home");
                                    A {
                                        href = "/";
                                        "HOME"
                                    }
                                },
                                Li {
                                    id = tabId(page, "documentation");
                                    A {
                                        href = "/documentation/current";
                                        "LEARN"
                                    }
                                },
                                Li {
                                    id = tabId(page, "download");
                                    A {
                                        href = "/download";
                                        "DOWNLOAD"
                                    }
                                },
                                Li {
                                    id = tabId(page, "community");
                                    A {
                                        href = "/community";
                                        "COMMUNITY"
                                    }
                                },
                                Li {
                                    id = tabId(page, "code");
                                    A {
                                        href = "/code";
                                        "CODE"
                                    }
                                },
                                Li {
                                    id = tabId(page, "blog");
                                    A {
                                        href = "/blog";
                                        "BLOG"
                                    }
                                }
                            }
                        }
                    }
                },
                Div {
                    id = "banner";
                    Div {
                        id = "elephant";
                        "\{NO-BREAK SPACE}"
                    },
                    Div {
                        id = "text";
                        "Static types that just work."
                    },
                    Div {
                        id = "code";
                        Comment("lang: none"),
                        Comment("try:"),
                        Pre {
                            attributes = ["data-language"->"ceylon"];
                            Code {
                                "shared void run() => newServer {
                                         Endpoint {
                                             path = startsWith(\"/\");
                                             acceptMethod = { get };
                                             (request, response) =>
                                                 response.writeString(\"Say more, more clearly\");
                                         }
                                     }.start();"
                            }
                        }
                    }
                },
                Div {
                    id = "primary-content";
                    content
                },
                Div {
                    clazz = "footer-bar";
                    footerPartial
                }
            };
}
