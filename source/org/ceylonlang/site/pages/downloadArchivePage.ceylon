import ceylon.html {
    A,
    Div,
    H1,
    H2,
    H3,
    Hr,
    I,
    Img,
    Option,
    P,
    Select,
    Table,
    Td,
    Tr
}


import org.ceylonlang.site.layouts {
    defaultLayout
}
import org.ceylonlang.site.util {
    ReleaseFile,
    releaseDate,
    releases
}


"Formats the given [[size]] as a number of mebibytes with a single decimal place."
String formatSize(Integer size)
        => formatFloat { // TODO Using Float.format caused a backend error.
            float = size.float / 1024 / 1024;
            maxDecimalPlaces = 1;
        };

Tr tableRow(ReleaseFile releaseFile, String type, String target, String image)
        => let (downloadHref = "/download/dist/``releaseFile.linkName``",
            downloadScript = "javascript: _gaq.push(['_trackPageview', '``downloadHref``?utm_source=download&amp;utm_medium=web&amp;utm_content=dist&amp;utm_campaign=latestrelease']);",
            downloadTitle = "Download the ``type``")
            Tr {
                Td {
                    A {
                        href = downloadHref;
                        title = downloadTitle;
                        attributes = ["onclick"->downloadScript];
                        Img {
                            src = image;
                            style = "vertical-align: middle; float: right; margin-right: 0.5em";
                        }
                    }
                },
                Td { type },
                Td { target },
                Td { "``formatSize(releaseFile.size)``MB" },
                Td {
                    A {
                        clazz = "bubble-button";
                        href = downloadHref;
                        title = downloadTitle;
                        attributes = ["onclick"->downloadScript];
                        "download"
                    }
                }
            };

shared object downloadArchivePage extends Page.fromCeylon(
    defaultLayout,
    [
        Page.keyTab->"download",
        Page.keyTitle->"Download Previous Eclipse Ceylon versions",
        Page.keyUniqueId->"downloadpage"
    ],
    Div {
        id = "banner";
        Div {
            id = "text";
            "Older Downloads"
        }
    },
    H1 {
        "Download Previous Eclipse Ceylon versions"
    },
    P {
        A {
            href = releases.first.releaseAnnouncement;
            releases.first.string
        },
        " is the latest 
         release of the language, command line tools and IDEs, but if 
         you need older versions of the Command-line distribution,
         you can find them all here."
    },
    H2 {
        "Command line tools"
    },
    P {
        "This package contains the Ceylon command line compiler for 
         Java and JavaScript virtual machines, the documentation 
         compiler, the test runner, the language module, the 
         module runtimes for the JVM and Node.js, and a suite of 
         additional command line tools."
    },
    P {
        "Go directly to a release: ",
        Select {
            attributes = ["onchange"->"window.location.hash = this.options[this.selectedIndex].value;"];
            {
                for (release in releases)
                    Option {
                        val = release.version;
                        release.string
                    }
            }
        }
    },
    *{
        for (release in releases)
            Div {
                I {
                    style = "float: right";
                    "Released on ``releaseDate(release)``"
                },
                H3 {
                    id = release.version;
                    "``release.string```` release == releases.first then " (Latest Release)" else "" ``"
                },
                Table {
                    tableRow(release.zipFile, "Zip archive", "All Operating Systems", "/images/download/package-zip.png"),
                    tableRow(release.rpmFile, "RPM", "Fedora/Red Hat", "/images/download/package-fedora.png"),
                    tableRow(release.debFile, "Debian package", "Debian/Ubuntu", "/images/download/package-debian.png")
                }
            }
    }.interpose(Hr()).chain({
        H2 {
            "Looking for nightly builds?"
        },
        P {
            "You can download pre-release builds of Eclipse Ceylon (distribution, SDK, IDEs) on our ",
            A {
                href = "https://ci-ceylon.rhcloud.com/";
                "Continuous Integration server."
            }
        }
    })
) {}
