import ceylon.file {
    Nil,
    current
}

void linkStaticDirectories() {
    void linkStaticDirectory(String name) {
        value resource = siteDirectory.childResource(name);
        
        if (is Nil resource) {
            resource.createSymbolicLink(current.childPath(name));
        }
    }
    
    linkStaticDirectory("easter-egg");
    linkStaticDirectory("images");
    linkStaticDirectory("js");
    linkStaticDirectory("stylesheets");
    linkStaticDirectory("xsd");
}
