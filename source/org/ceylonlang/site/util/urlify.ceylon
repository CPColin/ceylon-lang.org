import java.text {
    Normalizer
}

"Converts the given [[string]] into a normalized URL by making it lowercase, removing accents, and
 replacing whitespace with hyphens."
shared String urlify(String string) => String {
    for (character in Normalizer.normalize(string.lowercased, Normalizer.Form.nfd))
        if (character.digit || character.letter || character.whitespace || character == '-')
            character.whitespace then '-' else character
};
