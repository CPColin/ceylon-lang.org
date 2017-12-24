import ceylon.file {
    File
}
import ceylon.time.timezone {
    ZoneDateTime,
    timeZone,
    zoneDateTime
}

class InvalidBlogPostException() extends Exception("Blog post is invalid") {}

shared class BlogPost extends Page {
    static
    shared String formatIdentifier(Integer year, Integer month, Integer date, String title,
            Character delimiter) {
        function format(Integer integer) => integer < 10 then "0``integer``" else integer.string;
        
        return "/blog/``year````delimiter````format(month)````delimiter````format(date)````delimiter````title``/";
    }
    
    static
    shared [Integer|ParseException, Integer|ParseException, Integer|ParseException, String]
    parseIdentifier(String identifier) => [
        Integer.parse(identifier.substring(0, 4)),
        Integer.parse(identifier.substring(5, 7)),
        Integer.parse(identifier.substring(8, 10)),
        identifier.substring(11).removeTerminal(".md").removeTerminal("/")
    ];
    
    shared ZoneDateTime publishDate;
    
    shared actual String uri;
    
    shared new fromFile(String path, File file) extends Page.fromFile(path, file) {
        value [year, month, date, title] = parseIdentifier(file.name);
        
        if (is Integer year, is Integer month, is Integer date) {
            publishDate = zoneDateTime(timeZone.utc, year, month, date);
            uri = formatIdentifier(year, month, date, title, '/');
        } else {
            throw InvalidBlogPostException();
        }
    }
}
