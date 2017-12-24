import ceylon.file {
    File,
    current
}
import ceylon.http.server {
    Request,
    Response
}

import org.ceylonlang.site.pages {
    BlogIndexPage,
    BlogPost
}

void serveBlog(Request request, Response response) {
    value [year, month, date, title]
            = BlogPost.parseIdentifier(request.path.removeInitial("/blog/"));
    
    if (is Integer year, is Integer month, is Integer date) {
        value fileName = BlogPost.formatIdentifier(year, month, date, title, '-');
        value file = current.childPath(markdownPath(fileName)).resource;
        
        if (is File file) {
            servePage(request, response, BlogPost.fromFile(fileName, file));
            
            return;
        }
    }
    
    servePage(request, response, BlogIndexPage(request.path));
}
