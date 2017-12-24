import ceylon.file {
    Directory,
    current
}

import org.ceylonlang.site.util {
    currentDocumentationVersion
}

// TODO: traversal attack

String markdownPath(String path)
        => let (relativePath = path.startsWith("/") then path.rest else path,
            currentDocumentationPattern = "documentation/current/",
            currentDocumentationDestination = "documentation/``currentDocumentationVersion``/",
            rewrittenPath = relativePath.startsWith(currentDocumentationPattern)
                then currentDocumentationDestination + relativePath.substring(currentDocumentationPattern.size)
                else relativePath,
            resource = current.childPath(rewrittenPath).resource)
            if (is Directory resource)
            then rewrittenPath + "index.md"
            else (rewrittenPath.endsWith("/")
                            then rewrittenPath.substring(0, rewrittenPath.size - 1)
                            else rewrittenPath)
                        + ".md";
