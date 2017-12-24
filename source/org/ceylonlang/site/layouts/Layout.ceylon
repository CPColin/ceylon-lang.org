import ceylon.html {
    Html
}

import org.ceylonlang.site.pages {
    Page
}
import org.ceylonlang.site.util {
    Element
}

shared abstract class Layout {
    Map<String, String> properties;
    
    shared new({<String->String>*} properties = empty) {
        this.properties = map(properties);
    }
    
    shared formal Html layout(Page page, {Element*} content = page.elements);
    
    shared String? property(String key) => properties[key];
    
    shared String tabId(Page page, String tab)
            => tab == page.tab then "selected" else "notselected";
}
