import ceylon.file {
    Directory,
    File,
    Resource,
    current
}
import ceylon.time {
    Date,
    today
}

import org.ceylonlang.site.util {
    baseUrl,
    blogPosts,
    currentDocumentationVersion
}

shared object sitemap {
    shared String keyChangeFrequency = "change_frequency";
    
    shared String keyPriority = "priority";
    
    shared actual String string {
        value stringBuilder = StringBuilder();
        
        void append(String string) {
            stringBuilder.append(string);
            stringBuilder.appendNewline();
        }
        
        void appendElement(String uri, Date? lastModifiedDate = null, String? priority = null,
                String? changeFrequency = null) {
            append("  <url>");
            append("    <loc>``baseUrl``/``uri``</loc>");
            append("    <lastmod>``lastModifiedDate else today()``</lastmod>");
            // The default priority in Awestruct's Sitemap extension was 0.1 for a long while,
            // contrary to its own documentation. Despite that having been corrected, we'll stick
            // with 0.1, to keep the existing behavior consistent.
            append("    <priority>``priority else "0.1"``</priority>");
            append("    <changefreq>``changeFrequency else "never"``</changefreq>");
            append("  </url>");
        }
        
        void appendPage(Page page, String? uri = null) {
            value lastModifiedDate = if (is BlogPost page) then page.publishDate.date else null;
            value pageUri = if (is BlogPost page) then page.uri.rest else page.uri;
            
            appendElement(uri else pageUri, lastModifiedDate, page.property(keyPriority),
                page.property(keyChangeFrequency));
        }
        
        append("""<?xml version="1.0" encoding="utf-8" ?>""");
        append("""<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">""");
        
        void appendDirectory(Directory directory) {
            for (resource in directory.children().sort(byIncreasing(Resource.path))) {
                if (is Directory resource, !resource.name.startsWith("_")) {
                    appendDirectory(resource);
                } else if (is File resource, resource.name.endsWith(".md")) {
                    value path = resource.path.relativePath(current).string;
                    value page = directory.name == "blog"
                        then BlogPost.fromFile(path, resource)
                        else Page.fromFile(path, resource);
                    
                    appendPage(page);
                }
            }
        }
        
        value currentDirectory = current.resource;
        
        assert (is Directory currentDirectory);
        
        appendDirectory(currentDirectory);
        
        for (uri -> page in pages.sort(byIncreasing(Entry<String, Page>.key))) {
            appendPage(page, uri.rest);
        }
        
        if (exists latestBlogPost = blogPosts.first) {
            appendElement("blog/", latestBlogPost.publishDate.date, "0.75", "weekly");
        }
        
        appendElement("blog/authors/");
        appendElement("blog/tags/");
        
        void appendSpec(String uri) {
            appendElement("documentation/``currentDocumentationVersion``/spec/``uri``",
                null, "0.95", "monthly");
        }
        
        appendSpec("html/");
        appendSpec("html_single/");
        appendSpec("pdf/ceylon-language-specification.pdf");
        appendSpec("ceylon-language-specification-1.3.epub");
        
        append("</urlset>");
        
        return stringBuilder.string;
    }
}
