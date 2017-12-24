import ceylon.file {
    File,
    Resource,
    current
}
import ceylon.http.server {
    Request,
    Response
}

import org.ceylonlang.site.pages {
    Page
}

void serveMarkdown(Request request, Response response) {
    value path = markdownPath(request.path);
    Resource file = current.childPath(path).resource;
    
    assert (is File file);
    
    Page page = Page.fromFile(path, file);
    
    serveHtml(response, page.string);
}
