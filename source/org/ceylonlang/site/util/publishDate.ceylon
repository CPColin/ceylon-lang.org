import org.ceylonlang.site.pages {
    BlogPost
}

shared String publishDate(BlogPost blogPost)
        => dateLocale.formats.mediumFormatDate(blogPost.publishDate);
