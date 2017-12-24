import ceylon.html {
    A,
    Div,
    Span,
    Li,
    Ul
}

import org.ceylonlang.site.util {
    urlify
}

shared Div tagCloudPartial(String pathPrefix, {String*} tags)
        => Div {
            clazz = "tag-cloud";
            Ul {
                for (tag in tags)
                    Li {
                        Span {
                            clazz = "tag";
                            A {
                                href = "``pathPrefix````urlify(tag)``/";
                                tag
                            }
                        }
                    }
            }
        };
