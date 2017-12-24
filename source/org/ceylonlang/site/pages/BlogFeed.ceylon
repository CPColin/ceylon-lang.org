import ceylon.markdown.renderer {
    escapeHtml
}

import org.ceylonlang.site.util {
    baseUrl
}

shared class BlogFeedNotFoundException() extends Exception("Blog feed not found") {}

shared class BlogFeed(String path) {
    value pathTokens = BlogIndexPage.pathTokens(path);
    
    if (!pathTokens exists && path != "/blog/blog.atom") {
        throw BlogFeedNotFoundException();
    }
    
    if (exists pathTokens, pathTokens[0] == "tags") {
        throw BlogFeedNotFoundException();
    }
    
    shared actual String string {
        value blogPosts = BlogIndexPage.posts(path).take(50).sequence();
        
        if (!nonempty blogPosts) {
            throw BlogFeedNotFoundException();
        }
        
        value stringBuilder = StringBuilder();
        
        void append(String string) {
            stringBuilder.append(string);
            stringBuilder.appendNewline();
        }
        
        value selfUri = escapeHtml(baseUrl + path);
        value alternateUri = escapeHtml(baseUrl + path.removeTerminal("blog.atom"));
        
        append("""<?xml version="1.0" encoding="utf-8" ?>""");
        append("""<feed xml:lang="en-US" xmlns="http://www.w3.org/2005/Atom">""");
        append("  <id>``selfUri``</id>");
        append("  <title type=\"html\">``escapeHtml(BlogIndexPage.blogTitle(path, true))``</title>");
        append("  <updated>``blogPosts.first.publishDate``</updated>");
        append("  <link rel=\"self\" href=\"``selfUri``\" />");
        append("  <link rel=\"alternate\" type=\"text/html\" href=\"``alternateUri``\" />");
        append("  <link rel=\"related\" href=\"``escapeHtml(baseUrl)``\" />");
        
        for (blogPost in blogPosts) {
            value url = escapeHtml("``baseUrl````blogPost.uri``");
            
            append("  <entry>");
            append("    <id>``url``</id>");
            append("    <title type=\"html\">``escapeHtml(blogPost.title)``</title>");
            append("    <updated>``blogPost.publishDate``</updated>");
            append("    <link rel=\"alternate\" type=\"text/html\" href=\"``url``\" />");
            append("    <author>");
            append("      <name>``blogPost.author``</name>");
            append("    </author>");
            // TODO: plain-text summary (maybe)
            append("    <content type=\"html\" xml:base=\"``url``\">");
            for (element in blogPost.elements) {
                append(escapeHtml(element.string));
            }
            append("    </content>");
            append("  </entry>");
        }
        
        append("""</feed>""");
        
        return stringBuilder.string;
    }
}
