import ceylon.html {
    A,
    Div,
    I,
    Img,
    P,
    Raw,
    Table,
    Td,
    Tr
}

import org.ceylonlang.site.layouts {
    homeLayout
}

shared object rootPage extends Page.fromCeylon(
    homeLayout,
    {
        Page.keyTitle -> "Welcome to Ceylon",
        Page.keyTab -> "home",
        Page.keyUniqueId -> "homepage"
    },
    Table {
        id = "newsbar";
        Tr {
            Td {
                id = "newsbar-text";
                A {
                    href = "https://projects.eclipse.org/proposals/eclipse-ceylon";
                    title = "Eclipse Ceylon";
                    Img {
                        src = "/images/ceylon-eclipse.png";
                    }
                }
            },
            Td {
                id = "newsbar-text";
                ":markdown
                 August 21, 2017: Ceylon is moving to the [Eclipse Foundation][]!
                 
                 Read about the [move to Eclipse].
                 
                 [Ceylon 1.3.3][1.3.3] and Ceylon IDE 1.3.3 are now [available][download]!
                 
                 [download]: /download?utm_source=news&utm_medium=web&utm_content=download&utm_campaign=latestrelease
                 [1.3.3]: /blog/2017/08/21/ceylon-1-3-3/
                 [move to Eclipse]: /blog/2017/08/21/eclipse-ceylon/
                 [Eclipse Foundation]: https://projects.eclipse.org/proposals/eclipse-ceylon"
            },
            Td {
                id = "newsbar-services";
                P {
                    clazz = "bar";
                },
                A {
                    href = "/blog/";
                    I {
                        //alt = "Blog";
                        clazz = "fa fa-rss-square fa-2x";
                        //height = 32;
                        //width = 32;
                    }
                },
                " ",
                A {
                    href = "/+";
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
        }
    },
    Div {
        clazz = "action-bubbles";
        Div {
            clazz = "bubble";
            Div {
                clazz = "point-light-top";
                "\{NO-BREAK SPACE}"
            },
            Div {
                clazz = "bubble-block fixed-vertical-bubble";
                ":markdown
                 ## GROK IT
                 
                 Eclipse Ceylon is a **language for writing large programs in 
                 teams.** To learn more, read the 15 minute 
                 [quick intro](/documentation/current/introduction/),
                 before taking the [tour](/documentation/current/tour/)
                 of the language.",
                Div {
                    clazz = "bubble-bottom";
                    A {
                        clazz = "bubble-button";
                        href= "/documentation/current/";
                        "LEARN"
                    },
                    "\{NO-BREAK SPACE}",
                    A {
                        clazz = "bubble-button";
                        href = "http://try.ceylon-lang.org";
                        "PLAY"
                    }
                }
            },
            Div {
                clazz = "point-light-bottom";
                "\{NO-BREAK SPACE}"
            }
        },
        Div {
            clazz = "bubble";
            Div {
                clazz = "point-light-top";
                "\{NO-BREAK SPACE}"
            },
            Div {
                clazz = "bubble-block fixed-vertical-bubble";
                ":markdown
                 ## TRY IT OUT
                 
                 The best way to try it out is to download the IDE and 
                 **write some code**. Then you can explore the modules in 
                 [Ceylon Herd](https://herd.ceylon-lang.org/). 
                 Or you can try it [online](http://try.ceylon-lang.org/).",
                Div {
                    clazz = "bubble-bottom";
                    A {
                        clazz = "bubble-button";
                        href= "/download/";
                        "DOWNLOAD"
                    },
                    "\{NO-BREAK SPACE}",
                    A {
                        clazz = "bubble-button";
                        href = "https://herd.ceylon-lang.org/";
                        "EXPLORE"
                    }
                }
            },
            Div {
                clazz = "point-light-bottom";
                "\{NO-BREAK SPACE}"
            }
        },
        Div {
            clazz = "bubble";
            Div {
                clazz = "point-light-top";
                "\{NO-BREAK SPACE}"
            },
            Div {
                clazz = "bubble-block fixed-vertical-bubble";
                ":markdown
                 ## GET INVOLVED
                 
                 This is a **community** project. Everything we produce is 
                 [open source](/code/licenses/) and all our work happens 
                 **out in the open** on [GitHub](https://github.com/eclipse)
                 and [GitHub](https://github.com/ceylon).",
                Div {
                    clazz = "bubble-bottom";
                    A {
                        clazz = "bubble-button";
                        href= "/code/";
                        "HACK"
                    },
                    "\{NO-BREAK SPACE}",
                    A {
                        clazz = "bubble-button";
                        href = "/community/";
                        "PARTICIPATE"
                    }
                }
            },
            Div {
                clazz = "point-light-bottom";
                "\{NO-BREAK SPACE}"
            }
        }
    },
    Div {
        id = "ishas";
        Div {
            //CEYLON IS block
            //.hometitle-text
            //  %h1
            //    Ceylon is
            clazz = "action-bubbles";
            Div {
                clazz = "bubble";
                Div {
                    clazz = "bubble-block-transparent fixed-vertical-bubble";
                    ":markdown
                     ## POWERFUL
                     
                     Eclipse Ceylon's powerful **flow-sensitive static type system** 
                     catches many bugs while letting you express more, more 
                     easily: **union and intersection types**, tuples, 
                     function types, mixin inheritance, enumerated types, 
                     and **reified generics**."
                }
            },
            Div {
                clazz = "bubble";
                Div {
                    clazz = "bubble-block-transparent fixed-vertical-bubble";
                    ":markdown
                     ## READABLE
                     
                     We spend more time reading other people's code than 
                     writing our own. Therefore, Eclipse Ceylon prioritizes 
                     readability, via a **highly regular syntax**, support 
                     for **treelike structures**, and elegant syntax sugar 
                     where appropriate."
                }
            },
            Div {
                clazz = "bubble";
                Div {
                    clazz = "bubble-block-transparent fixed-vertical-bubble";
                    Raw(
                        ":markdown
                         ## PREDICTABLE
                         
                         Eclipse Ceylon **controls complexity with clarity**. The 
                         language eschews <!--cryptic syntax and--> magical 
                         implicit features with ambiguous corner cases. The 
                         compiler follows **simple, intuitive rules** and 
                         produces **meaningful errors**."
                    )
                }
            }
        },
        Div {
            //CEYLON HAS block
            //.hometitle-text
            //  %h1
            //    Ceylon has
            clazz = "action-bubbles";
            Div {
                clazz = "bubble";
                Div {
                    clazz = "bubble-block-transparent fixed-vertical-bubble";
                    ":markdown
                     ## A PLATFORM
                     
                     Eclipse Ceylon is a whole platform with a **modern SDK** designed 
                     from scratch. It runs on both **Java** and **JavaScript** 
                     virtual machines, bridging the gap between client and 
                     server. Ceylon is **fully interoperable** with Java and 
                     the Java SDK, and with JavaScript and its libraries."
                }
            },
            Div {
                clazz = "bubble";
                Div {
                    clazz = "bubble-block-transparent fixed-vertical-bubble";
                    ":markdown
                     ## WITH MODULARITY
                     
                     Modularity is at the very core of the language, SDK, and 
                     tooling. The compiler produces **module archives** which 
                     are then distributed via a next-generation **repository 
                     architecture** with **Ceylon Herd** as its social focus 
                     point."
                }
            },
            Div {
                clazz = "bubble";
                Div {
                    clazz = "bubble-block-transparent fixed-vertical-bubble";
                    ":markdown
                     ## AND TOOLING
                     
                     Static typing is the technology that enables **killer 
                     tools**. Eclipse Ceylon comes with a complete **command line 
                     toolset**, and an awesome **Eclipse based IDE** with 
                     searching, refactoring, quick fixes + assists, 
                     autocompletion, debugging, and much more."
                }
            }
        },
        Div {
            id = "features_link";
            A {
                clazz = "bubble-button";
                href = "/features";
                "SEE THE KEY FEATURES"
            },
            "\{NO-BREAK SPACE}\{NO-BREAK SPACE}\{NO-BREAK SPACE}",
            A {
                clazz = "bubble-button";
                href = "/documentation/current/ide/intellij/features";
                "FEATURES OF THE INTELLIJ IDE"
            },
            "\{NO-BREAK SPACE}\{NO-BREAK SPACE}\{NO-BREAK SPACE}",
            A {
                clazz = "bubble-button";
                href = "/documentation/current/ide/eclipse/features";
                "FEATURES OF THE ECLIPSE IDE"
            }
        }
    }
) {}
