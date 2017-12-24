import ceylon.html {
    A,
    Comment,
    Div,
    H1,
    Html,
    Li,
    P,
    Ul
}

import org.ceylonlang.site.pages {
    Page
}
import org.ceylonlang.site.partials {
    footerPartial
}
import org.ceylonlang.site.util {
    Element
}

shared object defaultLayout extends Layout() {
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
                    id = "primary-content";
                    content
                },
                Div {
                    clazz = "footer-bar";
                    footerPartial
                }
            };
}
