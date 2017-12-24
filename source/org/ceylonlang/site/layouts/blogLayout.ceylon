import ceylon.html {
    A,
    Div,
    Html
}

import org.ceylonlang.site.pages {
    Page
}
import org.ceylonlang.site.partials {
    blogPostPartial,
    disqusThreadPartial
}
import org.ceylonlang.site.util {
    Element,
    blogPosts
}

shared object blogLayout extends Layout() {
    function surroundingPosts(Page page) {
        value posts = blogPosts.sequence();
        
        if (exists index->_ = posts.locate((post) => page.uri == post.uri)) {
            return [posts[index + 1], posts[index - 1]];
        } else {
            return [null, null];
        }
    }
    
    shared actual Html layout(Page page, {Element*} _)
            => let ([previousPost, nextPost] = surroundingPosts(page))
                defaultLayout.layout {
                    page = page;
                    Div {
                        id = "banner";
                        Div {
                            id = "text";
                            "Blog"
                        }
                    },
                    Div {
                        id = "post-navigation";
                        Div {
                            clazz = "post-navigation";
                            Div {
                                id = "post-nav-previous";
                                Div {
                                    clazz = "previous";
                                    if (exists previousPost)
                                    then {
                                        Div {
                                            clazz = "label";
                                            "previous post"
                                        },
                                        Div {
                                            clazz = "nav-link";
                                            A {
                                                href = previousPost.uri;
                                                previousPost.title
                                            }
                                        }
                                    }
                                    else null
                                }
                            },
                            Div {
                                id = "post-nav-next";
                                Div {
                                    clazz = "next";
                                    if (exists nextPost)
                                    then {
                                        Div {
                                            clazz = "label";
                                            "next post"
                                        },
                                        Div {
                                            clazz = "nav-link";
                                            A {
                                                href = nextPost.uri;
                                                nextPost.title
                                            }
                                        }
                                    }
                                    else null
                                }
                            }
                        }
                    },
                    Div {
                        id = "core-page";
                    },
                    blogPostPartial(page, disqusThreadPartial)
                };
}
