import ceylon.file {
    Directory,
    File,
    current
}

import org.ceylonlang.site.pages {
    Page
}

"Returns every Markdown file in the given [[directory]] under the `_data` directory."
{File*} dataFiles(String directory) {
    value resource = current.childPath("_data/``directory``").resource;
    
    assert (is Directory resource);
    
    return {
        for (file in resource.files("*.md"))
            file
    };
}

"Returns every [[Page]] in the given [[directory]] under the `_data` directory, sorted by
 [[Page.level]] and [[Page.name]]."
shared {Page*} data(String directory,
        Comparison(Page, Page) comparison
            = comparing(byIncreasing(Page.level), byIncreasing(Page.name))) => {
    for (dataFile in dataFiles(directory))
        Page.fromFile("/_data/``directory``/``dataFile.name``", dataFile)
}.sort(comparison);
