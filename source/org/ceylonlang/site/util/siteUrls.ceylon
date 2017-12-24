String apiDocUrl(String moduleName, String version = releases.first.version)
        => "https://modules.ceylon-lang.org/repo/1/ceylon/``moduleName``/``version``/module-doc";

shared String baseUrl = "https://ceylon-lang.org";

String finalVersion10 = "1.0.0";
String finalVersion11 = "1.1.0";
String finalVersion12 = "1.2.2";

shared String googlePlusUrl = "https://plus.google.com/102481741611133754149";

shared Map<String,String> siteUrls = map {
    "spec_current"->"/documentation/current/spec/html_single/index.html",
    "spec_relative"->"spec/html_single/index.html",
    "apidoc_current"->apiDocUrl("language"),
    "apidoc_1_0"->apiDocUrl("language", finalVersion10),
    "apidoc_1_1"->apiDocUrl("language", finalVersion11),
    "apidoc_1_2"->apiDocUrl("language", finalVersion12),
    "apidoc_1_3"->apiDocUrl("language"),
    "ceylon_tool_current"->"/documentation/current/reference/tool/ceylon/subcommands",
    
    "apidoc_current_language"->apiDocUrl("language"),
    "apidoc_current_buffer"->apiDocUrl("buffer"),
    "apidoc_current_collection"->apiDocUrl("collection"),
    "apidoc_current_dbc"->apiDocUrl("dbc"),
    "apidoc_current_decimal"->apiDocUrl("decimal"),
    "apidoc_current_file"->apiDocUrl("file"),
    "apidoc_current_html"->apiDocUrl("html"),
    "apidoc_current_http_client"->apiDocUrl("http/client"),
    "apidoc_current_http_common"->apiDocUrl("http/common"),
    "apidoc_current_http_server"->apiDocUrl("http/server"),
    "apidoc_current_interop_browser"->apiDocUrl("interop/browser"),
    "apidoc_current_interop_java"->apiDocUrl("interop/java"),
    "apidoc_current_interop_persistence"->apiDocUrl("interop/persistence"),
    "apidoc_current_interop_spring"->apiDocUrl("interop/spring"),
    "apidoc_current_io"->apiDocUrl("io"),
    "apidoc_current_json"->apiDocUrl("json"),
    "apidoc_current_locale"->apiDocUrl("locale"),
    "apidoc_current_logging"->apiDocUrl("logging"),
    "apidoc_current_math"->apiDocUrl("math"),
    "apidoc_current_net"->apiDocUrl("net", finalVersion12),
    "apidoc_current_numeric"->apiDocUrl("numeric"),
    "apidoc_current_process"->apiDocUrl("process"),
    "apidoc_current_promise"->apiDocUrl("promise"),
    "apidoc_current_random"->apiDocUrl("random"),
    "apidoc_current_regex"->apiDocUrl("regex"),
    "apidoc_current_test"->apiDocUrl("test"),
    "apidoc_current_time"->apiDocUrl("time"),
    "apidoc_current_transaction"->apiDocUrl("transaction"),
    "apidoc_current_unicode"->apiDocUrl("unicode"),
    "apidoc_current_uri"->apiDocUrl("uri"),
    "apidoc_current_whole"->apiDocUrl("whole")
};
