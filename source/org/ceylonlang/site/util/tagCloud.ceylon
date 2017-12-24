shared {String*} tagCloud => set {
    for (blogPost in blogPosts)
        for (tag in tags(blogPost))
            tag
}.sort(increasing);
