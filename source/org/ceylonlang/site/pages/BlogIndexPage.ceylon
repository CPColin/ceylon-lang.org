import ceylon.html {
    A,
    Br,
    Div,
    H1,
    H3,
    H4,
    Script,
    Span
}
import ceylon.regex {
    regex
}

import org.ceylonlang.site.layouts {
    defaultLayout
}
import org.ceylonlang.site.partials {
    blogPostPartial,
    disqusCommentLinkPartial,
    followCeylonPartial,
    tagCloudPartial
}
import org.ceylonlang.site.util {
    authorCloud,
    blogPosts,
    data,
    publishDate,
    tagCloud,
    tags,
    urlify
}

// TODO: constants for "authors" and "tags"

shared class BlogIndexPage extends Page {
    static
    shared Integer? page(String path)
            => let (match = regex("/([0-9]+)/$").find(path),
                    page = match?.groups?.get(0))
                if (exists page) then parseInteger(page) else null;
    
    static
    shared String baseUrl(String path)
            => if (exists currentPage = page(path))
                then path.removeTerminal("``currentPage``/")
                else path;
    
    static
    shared String[2]? pathTokens(String path)
            => let (tokens = path.split('/'.equals).sequence())
                if (exists blogToken = tokens[1], blogToken == "blog",
                    exists type = tokens[2], type == "authors" || type == "tags",
                    exists target = tokens[3])
                then [type, target]
                else null;
    
    static
    shared {BlogPost*} posts(String path) {
        if (exists tokens = pathTokens(path)) {
            value [type, target] = tokens;
            
            if (type == "authors") {
                return blogPosts.filter((blogPost) => urlify(blogPost.author) == target);
            } else if (type == "tags") {
                return blogPosts.filter((blogPost) => tags(blogPost).contains(target));
            }
        }
        
        return blogPosts;
    }
    
    static
    function authorBio(String path)
            => if (exists tokens = pathTokens(path), tokens.first == "authors",
                    exists bio = data("team").find((page) => urlify(page.name) == tokens.last))
                then bio
                else null;
    
    static
    function tag(String path)
            => if (exists tokens = pathTokens(path), tokens.first == "tags", !tokens.last.empty)
                then tokens.last
                else null;
    
    static
    shared String blogTitle(String path, Boolean showSiteNameOnTeamBlog = false)
            => if (exists bio = authorBio(path))
                then "Posts by ``bio.name``"
                else if (exists targetTag = tag(path))
                then "Posts tagged \"``targetTag``\""
                else if (showSiteNameOnTeamBlog)
                then "Ceylon team blog"
                else "Team blog";
    
    static
    function paginatorLinks(String path, Integer lastPage) {
        function link(Integer page)
                => page == 1 then baseUrl(path) else "``baseUrl(path)````page``/";
        
        value currentPage = page(path) else 1;
        value previousLink = currentPage > 1 then A {
            clazz = "previous-link";
            href = link(currentPage - 1);
            "Previous"
        };
        value nextLink = currentPage < lastPage then A {
            clazz = "next-link";
            href = link(currentPage + 1);
            "Next"
        };
        value window = 2;
        
        return [
            Div {
                clazz = "pagination-links";
                previousLink,
                *{
                    for (page in 1..lastPage)
                        if (page == currentPage)
                        then Span {
                            clazz = "current-page";
                            currentPage.string
                        }
                        else if (page <= window
                            || page > lastPage - window
                            || (page > currentPage - window
                                && page < currentPage + window))
                        then A {
                            clazz = "page-link";
                            href = link(page);
                            page.string
                        }
                        else if (page == currentPage - window
                            || page == currentPage + window)
                        then Span {
                            clazz = "skip";
                            "..."
                        }
                        else null
                }.chain({ nextLink })
            },
            currentPage
        ];
    }
    
    static
    function postsAndPaginator(String path) {
        value pageSize = 5;
        value blogPosts = posts(path).sequence();
        value lastPage = blogPosts.size / pageSize + (blogPosts.size % pageSize == 0 then 0 else 1);
        value [paginator, currentPage] = paginatorLinks(path, lastPage);
        value offset = pageSize * (currentPage - 1);
        
        return {
            for (blogPost in blogPosts.measure(offset, pageSize))
                blogPostPartial(blogPost, disqusCommentLinkPartial)
        }.chain { paginator };
    }
    
    shared new(String path) extends Page.fromCeylon(
        defaultLayout,
        [
            Page.keyTab->"blog",
            Page.keyTitle->blogTitle(path),
            Page.keyUniqueId->"blogpage",
            sitemap.keyChangeFrequency->"weekly",
            sitemap.keyPriority->"0.75"
        ],
        Div {
            id = "sidebar";
            if (!tag(path) exists)
            then {
                Div {
                    clazz = "point-dark-top";
                    "\{NO-BREAK SPACE}"
                },
                Div {
                    clazz = "sidebar-dark";
                    H3 {
                        id = "feed";
                        A {
                            href = "``baseUrl(path)``blog.atom";
                            if (exists bio = authorBio(path))
                            then "``bio.name``'s Feed"
                            else "Feed"
                        }
                    }
                },
                Div {
                    clazz = "point-dark-bottom";
                    "\{NO-BREAK SPACE}"
                }
            }
            else null,
            if (exists bio = authorBio(path))
            then {
                Div {
                    clazz = "point-light-top";
                    "\{NO-BREAK SPACE}"
                },
                Div {
                    clazz = "sidebar-block";
                    Div {
                        clazz = "expandable";
                        H3 {
                            "Bio"
                        },
                        bio.elements
                    }
                },
                Div {
                    clazz = "point-light-end";
                    "\{NO-BREAK SPACE}"
                }
            }
            else null,
            Div {
                clazz = "point-light-top";
                "\{NO-BREAK SPACE}"
            },
            Div {
                clazz = "sidebar-block";
                H3 {
                    "Recent posts"
                },
                Div {
                    id = "blog-archive";
                    {
                        for (blogPost in blogPosts.take(5))
                            H4 {
                                A {
                                    href = blogPost.uri;
                                    blogPost.title
                                },
                                Br,
                                "by ``blogPost.author``",
                                Br,
                                publishDate(blogPost)
                            }
                    }
                },
                H3 {
                    "Tags"
                },
                Div {
                    clazz = "tag-cloud";
                    tagCloudPartial("/blog/tags/", tagCloud)
                },
                H3 {
                    "Authors"
                },
                Div {
                    clazz = "tag-cloud";
                    tagCloudPartial("/blog/authors/", authorCloud)
                }
            },
            Div {
                clazz = "point-light-end";
                "\{NO-BREAK SPACE}"
            },
            followCeylonPartial
        },
        Div {
            id = "banner";
            Div {
                id = "text";
                "Blog"
            }
        },
        Div {
            id = "core-page";
            H1 {
                blogTitle(path)
            },
            *postsAndPaginator(path)
        },
        Script {
            """/* place div.expandable to 
                * - minHeight by default 
                * - full size on click
                * - back to minHeight on second click
                * with a jQuery animation
                */
               var minHeight=150;
               $(document).ready( function() {
                   $("div.expandable").height(minHeight);     
                   $("div.expandable").click(function(e) 
                   {
                       if( !$(e.target).is("a")) {
                           $this = $(this); 
                           var currentHeight = $this.height();
                           if(currentHeight==minHeight) {
                               $this.css('height', 'auto');
                           }
                           else{
                               $this.css('height', minHeight + 'px');
                           };
                           var height = $this.height();
                           $this.css('height', currentHeight + 'px');
                           $this.animate({'height':height}, 500);
                       }
                   })
               });"""
        }
    ) {}
}
