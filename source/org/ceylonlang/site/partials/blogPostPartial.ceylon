import ceylon.html {
    A,
    Div,
    H1
}

import org.ceylonlang.site.pages {
    BlogPost,
    Page
}
import org.ceylonlang.site.util {
    Element,
    publishDate,
    tags,
    urlify
}

shared Div blogPostPartial(Page page, {Element*}(Page) disqusPartial)
        => Div {
            clazz = "post";
            H1 {
                clazz = "title";
                A {
                    href = page.uri;
                    page.title
                }
            },
            Div {
                clazz = "byline";
                Div {
                    clazz = "author";
                    "by ",
                    A {
                        href = "/blog/authors/``urlify(page.author)``/";
                        "``page.author``"
                    }
                },
                Div {
                    clazz = "date";
                    if (is BlogPost page) then publishDate(page) else null
                },
                Div {
                    clazz = "tags";
                    {
                        for (tag in tags(page))
                            A {
                                href = "/blog/tags/``urlify(tag)``/";
                                tag
                            }
                    }
                }
            },
            Div {
                clazz = "body";
                page.elements.chain(disqusPartial(page))
            }
        };
