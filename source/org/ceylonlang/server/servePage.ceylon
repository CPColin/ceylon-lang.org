import ceylon.http.server {
    Request,
    Response
}

import org.ceylonlang.site.pages {
    Page,
    notFoundPage,
    pages
}

void servePage(Request request, Response response,
        Page page = pages[request.path] else notFoundPage) {
    serveHtml(response, page.string);
}
