import ceylon.http.common {
    get
}
import ceylon.http.server {
    AsynchronousEndpoint,
    Endpoint,
    Matcher,
    endsWith,
    equals,
    newServer,
    startsWith
}
import ceylon.http.server.endpoints {
    serveStaticFile
}

import org.ceylonlang.site.pages {
    BlogCloudPage
}

"Run the module `org.ceylonlang`."
shared void run() {
    value blogEndpoint = Endpoint(
        startsWith("/blog/"),
        serveBlog,
        { get }
    );
    
    value blogCloudEndpoint = Endpoint(
        equals("/blog/authors/").or(equals("/blog/tags/")),
        (request, response) => servePage(request, response, BlogCloudPage(request.path)),
        { get }
    );
    
    value blogFeedEndpoint = Endpoint(
        startsWith("/blog/").and(endsWith("/blog.atom")),
        (request, response) => serveFeed(request, response, request.path),
        { get }
    );
    
    value markdownEndpoint = Endpoint(
        markdownMatcher,
        serveMarkdown,
        { get }
    );
    
    value pageEndpoint = Endpoint(
        object extends Matcher() {
            // Match everything so we serve the 404 page, too.
            matches(String path) => true;
        },
        servePage,
        { get }
    );
    
    // TODO: still doesn't redirect /documentation/1.3
    value redirectEndpoint = AsynchronousEndpoint(
        object extends Matcher() {
            matches(String path)
                    => !path.endsWith("/") && path.lastIndexOf(".") <= path.lastIndexOf("/");
        },
        redirectTrailingSlash,
        { get }
    );
    
    value sitemapEndpoint = Endpoint(
        equals("/sitemap.xml"),
        serveSitemap,
        { get }
    );
    
    // TODO: traversal attack
    // also use the notFound page when the static resource doesn't exist
    value staticEndpoint = AsynchronousEndpoint(
        startsWith("/images/")
            .or(startsWith("/js/"))
            .or(startsWith("/stylesheets/"))
            .or(equals("/favicon.ico")),
        serveStaticFile("."),
        { get });
    
    value server = newServer {
        staticEndpoint,
        sitemapEndpoint,
        redirectEndpoint,
        markdownEndpoint,
        blogFeedEndpoint,
        blogCloudEndpoint,
        blogEndpoint,
        pageEndpoint
    };
    
    server.start();
}
