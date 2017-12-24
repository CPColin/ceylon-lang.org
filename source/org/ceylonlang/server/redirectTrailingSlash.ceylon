import ceylon.http.common {
    Header
}
import ceylon.http.server {
    Request,
    Response
}

void redirectTrailingSlash(Request request, Response response, Anything _) {
    response.status = redirectPermanentlyWithSameMethod;
    response.addHeader(Header("Location", request.path + "/"));
    response.writeString(""); // Have to write something so the headers get sent
}
