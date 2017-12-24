import ceylon.file {
    Nil
}

void exportFile(String path, String contents) {
    print("Writing ``contents.size`` characters to \"``path``\"");
    
    function createFile() {
        value file = siteDirectory.childResource(path);
        
        assert (is Nil file);
        
        return file.createFile(true);
    }
    
    try (writer = createFile().Overwriter()) {
        writer.write(contents);
    }
}
