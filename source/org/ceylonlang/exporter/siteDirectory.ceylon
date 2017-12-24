import ceylon.file {
    Directory,
    File,
    Nil,
    Visitor,
    current
}

Directory siteDirectory = (function() {
    value directoryName = "_site";
    value path = current.childPath(directoryName);
    
    void clearDirectory() {
        path.visit(object extends Visitor() {
            shared actual void afterDirectory(Directory directory) {
                if (!directory.path.equals(path)) {
                    directory.delete();
                }
            }
            
            shared actual void file(File file) {
                file.delete();
            }
        });
    }
    
    function createDirectory() {
        value directory = path.resource;
        
        if (is Nil directory) {
            return directory.createDirectory();
        } else {
            assert (is Directory directory);
            
            return directory;
        }
    }
    
    clearDirectory();
    
    return createDirectory();
})();
