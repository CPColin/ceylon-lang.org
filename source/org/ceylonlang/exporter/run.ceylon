"Generates the `ceylon-lang.org` website and exports it as static content."
shared void run() {
    linkStaticDirectories();
    
    exportFile(".htaccess", htaccess);
    
    // TODO: quick mode
    
    exportMarkdownFiles();
    
    exportPages();
}
