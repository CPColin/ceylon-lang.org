import ceylon.http.server {
    Response
}

void serveHtml(Response response, String html) {
    response.writeString(html);
}
