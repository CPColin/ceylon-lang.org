import ceylon.html {
    Body,
    Comment,
    Div,
    Head,
    Html,
    Link,
    Meta,
    Script,
    Title
}

import org.ceylonlang.site.pages {
    Page
}
import org.ceylonlang.site.partials {
    disqusCommentCountPartial,
    googleAnalyticsPartial
}
import org.ceylonlang.site.util {
    Element,
    googlePlusUrl
}

shared object baseLayout extends Layout() {
    shared actual Html layout(Page page, {Element*} content)
            => Html {
                Head {
                    Meta {
                        content = "text/html; charset=utf-8";
                        httpEquiv = "content-type";
                    },
                    Title { "Eclipse Ceylon: ``page.title``" },
                    Link {
                        href = "/images/favicon.ico";
                        rel = "shortcut icon";
                        type = "image/vnd.microsoft.icon";
                    },
                    Link {
                        href = googlePlusUrl;
                        rel = "publisher";
                    },
                    Link {
                        href = "/stylesheets/themes/paraiso-dark.css";
                        rel = "stylesheet";
                    },
                    Link {
                        href = "/stylesheets/screen.css";
                        media = "screen, projection";
                        rel = "stylesheet";
                    },
                    Link {
                        href = "/stylesheets/print.css";
                        media = "print";
                        rel = "stylesheet";
                    },
                    Comment(
                        """[if lt IE 8]>
                             <link href="/stylesheets/ie.css" media="screen, projection" rel="stylesheet" />
                           <![endif]"""
                    ),
                    Link {
                        href = "/blog/blog.atom";
                        rel = "alternate";
                        type = "application/atom+xml";
                    },
                    Link {
                        href = "//fonts.googleapis.com/css?family=Source+Sans+Pro%7CPT+Sans%7CPT+Sans:700%7CInconsolata%7CInconsolata:700%7CArvo";
                        rel = "stylesheet";
                        type = "text/css";
                    },
                    Link {
                        href = "//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css";
                        rel = "stylesheet";
                    },
                    Script {
                        src = "https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js";
                    },
                    Script {
                        src = "/js/jquery-ui-1.8.22.custom.min.js";
                    },
                    Script {
                        src = "/js/common.js";
                    },
                    Script {
                        src = "/js/rainbow.min.js";
                    },
                    Script {
                        src = "/js/language/ceylon.js";
                    },
                    Script {
                        src = "/js/language/java.js";
                    },
                    Script {
                        src = "/js/language/javascript.js";
                    },
                    Script {
                        src = "/js/language/html.js";
                    },
                    Script {
                        src = "/js/language/shell.js";
                    },
                    googleAnalyticsPartial
                },
                Body {
                    clazz = "bp";
                    Div {
                        clazz = page.uniqueId;
                        id = "container";
                        content
                    },
                    disqusCommentCountPartial
                }
            };
}
