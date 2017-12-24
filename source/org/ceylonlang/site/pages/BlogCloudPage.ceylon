import ceylon.html {
    Div,
    H1
}

import org.ceylonlang.site.layouts {
    defaultLayout
}
import org.ceylonlang.site.partials {
    tagCloudPartial
}
import org.ceylonlang.site.util {
    authorCloud,
    tagCloud
}

shared class BlogCloudPage extends Page {
    static
    function tags(String path) => let (tokens = BlogIndexPage.pathTokens(path))
        if (exists tokens)
        then (if (tokens[0] == "authors")
            then authorCloud
            else if (tokens[0] == "tags")
            then tagCloud
            else nothing)
        else nothing;
    
    static
    function title(String path) => let (tokens = BlogIndexPage.pathTokens(path))
        if (exists tokens)
        then (if (tokens[0] == "authors")
            then "Authors"
            else if (tokens[0] == "tags")
            then "Tags"
            else nothing)
        else nothing;
    
    shared new (String path) extends Page.fromCeylon(
        defaultLayout,
        [
            Page.keyTab->"blog",
            Page.keyTitle -> title(path),
            Page.keyUniqueId->"blogpage"
        ],
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
                title(path)
            },
            tagCloudPartial(path, tags(path))
        }
    ) {}
}
