import ceylon.buffer.charset {
    utf8
}
import ceylon.http.common {
    contentType
}
import ceylon.http.server {
    Request,
    Response
}

import org.ceylonlang.site.pages {
    sitemap
}

void serveSitemap(Request request, Response response) {
    value content = sitemap.string;
    
    response.addHeader(contentType {
        charset = utf8;
        contentType = "text/xml";
    });
    
    response.writeStringAsynchronous(content);
}
