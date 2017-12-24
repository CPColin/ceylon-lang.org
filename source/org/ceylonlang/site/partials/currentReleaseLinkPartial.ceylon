import ceylon.html {
    A,
    H4
}

shared H4 currentReleaseLinkPartial(String version)
        => H4 {
            "Note: information on this page refers to Ceylon ``version``, not to the ",
            A {
                href = "/documentation/current/";
                "current release"
            },
            "."
        };
