import org.ceylonlang.site.pages {
    pages
}

void exportPages() {
    for (path -> page in pages) {
        exportFile {
            contents = page.string;
            path = path == "/"
                then "index.html"
                else path.rest.replaceLast("/", ".html");
        };
    }
}
