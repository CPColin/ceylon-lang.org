import org.ceylonlang.site.pages {
    Page
}

shared {String*} tags(Page page) {
    function splitTags(String tags) => {
        for (tag in tags.split(','.equals))
            tag.trimmed
    };
    
    function stripBrackets(String tags)
            => tags.startsWith("[") && tags.endsWith("]")
                    then tags.substring(1, tags.size - 1)
                    else tags;
    
    return splitTags(stripBrackets(page.property("tags") else ""));
}
