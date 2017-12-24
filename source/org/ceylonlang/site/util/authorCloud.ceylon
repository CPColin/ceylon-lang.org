shared {String*} authorCloud => set {
    for (author in blogPosts*.author)
        if (!author.empty)
            author
}.sort(increasing);
