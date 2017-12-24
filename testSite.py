import os
import SimpleHTTPServer

class SuffixHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    """
    Adapted from here:
    https://stackoverflow.com/questions/28419287/configuring-simplehttpserver-to-assume-html-for-suffixless-urls
    """
    def do_GET(self):
        path = self.translate_path(self.path)
        print(path)
        path = path.rstrip("/")
        print(path)
        
        # If the path doesn't exist, assume it's a resource suffixed '.html'.
        if not os.path.exists(path):
            self.path = self.path.rstrip("/") + '.html'

        # Call the superclass methods to actually serve the page.
        SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)

SimpleHTTPServer.test(SuffixHandler)
