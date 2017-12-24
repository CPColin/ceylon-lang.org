import ceylon.file {
    Directory,
    File,
    current
}

"Returns every [[File]] in the `blog` directory that represents a post, in order from latest to
 earliest."
shared {File*} blogFiles {
    value blogDirectory = current.childPath("blog").resource;
    
    assert (is Directory blogDirectory);
    
    return {
        for (file in blogDirectory.files("*.md"))
            if (exists firstCharacter = file.name.first, firstCharacter.digit)
                file
    }.sort(byDecreasing(File.name));
}
