import org.ceylonlang.site.util {
    googlePlusUrl
}

shared Integer redirectPermanentlyWithGetMethod = 301;
shared Integer redirectPermanentlyWithSameMethod = 308;
shared Integer redirectTemporarilyWithGetMethod = 303;
shared Integer redirectTemporarilyWithSameMethod = 307;

"Redirects that match when the requested path exactly matches the key."
shared [<String->String>*] exactMatchRedirects = [
    // Redirect old documentation links.
    "documentation"->"/documentation/current/",
    "documentation/"->"/documentation/current/",
    "documentation/index.html"->"/documentation/current/",
    // Redirect Google+ links.
    """\+"""->googlePlusUrl,
    "plus"->googlePlusUrl,
    // Redirect forum link.
    "community/forum"->"http://groups.google.com/group/ceylon-users"
];

"Redirects that match when the requested path starts with the key. The rest of the URL is added to
 the destination path when the redirect is performed."
shared [<String->String>*] prefixRedirects = [
    // Redirect mis-encoded blog URL for Stéphane Épardaud.
    "blog/authors/styephane-yepardaud/"->"/blog/authors/stephane-epardaud/",
    // Redirect other old documentation links.
    "documentation/faq/"->"/documentation/current/faq/",
    "documentation/ide/"->"/documentation/current/ide/",
    "documentation/introduction/"->"/documentation/current/introduction/",
    "documentation/presentation/"->"/documentation/current/presentation/",
    "documentation/reference/"->"/documentation/current/reference/",
    "documentation/roadmap/"->"/documentation/current/roadmap/",
    "documentation/spec/"->"/documentation/current/spec/",
    "documentation/tour/"->"/documentation/current/tour/"
];
