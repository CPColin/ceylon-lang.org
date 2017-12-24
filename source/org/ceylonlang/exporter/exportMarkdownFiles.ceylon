import ceylon.file {
    Directory,
    File,
    Visitor,
    current
}

import org.ceylonlang.site.pages {
    BlogPost,
    Page
}

void exportMarkdownFiles() {
    current.visit(object extends Visitor() {
        beforeDirectory(Directory directory) => !directory.name.startsWith("_");
        
        shared actual void file(File file) {
            if (!file.name.endsWith(".md")) {
                return;
            }
            
            value path = file.path.relativePath(current).string.replaceLast(".md", ".html");
            
            //if (path.contains('/')) { // TODO
            //    return;
            //}
            
            value page = path.startsWith("blog/")
                then BlogPost.fromFile(path, file)
                else Page.fromFile(path, file);
            value uri = page is BlogPost
                then page.uri.rest.replaceLast("/", ".html")
                else page.uri;
            
            exportFile(uri, page.string);
        }
    });
}
