import ceylon.file {
    current,
    File
}
import ceylon.http.server {
    Matcher
}

object markdownMatcher extends Matcher() {
    shared actual Boolean matches(String path)
            => let (file = current.childPath(markdownPath(path)).resource)
                file is File;
}
