import ceylon.http.common {
    contentType
}
import ceylon.http.server {
    Request,
    Response
}
import ceylon.buffer.charset {
    utf8
}

import org.ceylonlang.site.pages {
    BlogFeed,
    notFoundPage
}

void serveFeed(Request request, Response response, String path) {
    try {
        value content = BlogFeed(request.path).string;
        
        response.addHeader(contentType {
            charset = utf8;
            contentType = "application/atom+xml";
        });
        
        response.writeStringAsynchronous(content);
    } catch (e) {
        servePage(request, response, notFoundPage);
    }
}
