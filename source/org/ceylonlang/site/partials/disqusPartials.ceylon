import ceylon.html {
    A,
    Div,
    NoScript,
    Script
}

import org.ceylonlang.site.pages {
    Page
}
import org.ceylonlang.site.util {
    baseUrl
}

String disqusShortName = "ceylonlang";

shared Script disqusCommentCountPartial
        => Script {
            "var disqus_shortname = '``disqusShortName``';
             (function () {
                 var s = document.createElement('script'); s.async = true;
                 s.src = \"//disqus.com/forums/ceylonlang/count.js\";
                 (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
             }());"
        };

shared {Div*} disqusCommentLinkPartial(Page page) => {
    Div {
        clazz = "tail";
        A {
            href = "``page.uri``#disqus_thread";
            "Comments"
        }
    }
};

shared {Div|NoScript|Script*} disqusThreadPartial(Page page) => {
    Div {
        id = "disqus_thread";
    },
    Script {
        "var disqus_shortname = '``disqusShortName``';
         var disqus_url = \"``baseUrl``/``page.uri``\";
         
         (function() {
             var dsq = document.createElement(\"script\"); dsq.type = \"text/javascript\"; dsq.async = true;
             dsq.src = \"//ceylonlang.disqus.com/embed.js\";
             (document.getElementsByTagName(\"head\")[0] || document.getElementsByTagName(\"body\")[0]).appendChild(dsq);
         })();"
    },
    NoScript {
        "Please enable JavaScript to view the ",
        A {
            href = "//disqus.com/?ref_noscript=``disqusShortName``";
            "comments powered by Disqus."
        }
    }
};
