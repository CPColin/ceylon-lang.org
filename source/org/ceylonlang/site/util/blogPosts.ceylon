import org.ceylonlang.site.pages {
    BlogPost
}


"Returns every [[BlogPost]] in the `blog` directory, in order from latest to earliest."
shared {BlogPost*} blogPosts => {
    for (file in blogFiles)
        BlogPost.fromFile("/blog/``file.name``", file)
};
