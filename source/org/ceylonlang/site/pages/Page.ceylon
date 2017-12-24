import ceylon.file {
    File,
    lines
}
import ceylon.html {
    Raw,
    Ul,
    renderTemplate
}
import ceylon.markdown.parser {
    Parser
}
import ceylon.markdown.renderer {
    CeylonHtmlRenderer,
    RenderOptions,
    textContent
}
import ceylon.regex {
    MatchResult,
    regex
}
import ceylon.time {
    Date,
    Period,
    today
}
import ceylon.time.iso8601 {
    parseDate
}

import org.ceylonlang.site.layouts {
    Layout,
    defaultLayout
}
import org.ceylonlang.site.util {
    Element,
    resolveResource,
    siteUrls
}

shared class Page {
    static
    String->String extractProperty(String line) {
        value delimiter = ": ";
        value split = line.indexOf(delimiter);
        
        if (split == -1) {
            return line->"";
        } else {
            value key = line.substring(0, split);
            value item = line.substring(split + delimiter.size);
            
            return key -> (item.startsWith("'") && item.endsWith("'")
                then item.substring(1, item.size - 1)
                else item);
        }
    }
    
    static
    [[<String->String>*], String] extractProperties({String*} lines) {
        value locations = lines.locations("---".equals).sequence();
        value [headerStart, headerEnd] = [locations[0], locations[1]];
        
        if (exists headerStart, exists headerEnd, headerStart.key == 0) {
            return let (start = headerStart.key + 1, end = headerEnd.key) [
                    [
                        for (line in lines.skip(start).take(end - start))
                            extractProperty(line)
                    ],
                    "\n".join(lines.skip(end + 1))
                ];
        } else {
            return [empty, "\n".join(lines)];
        }
    }
    
    static
    shared String keyHomePage = "homepage";
    
    static
    shared String keyPhoto = "photo";
    
    static
    shared String keyTab = "tab";
    
    static
    shared String keyTitle = "title";
    
    static
    shared String keyUniqueId = "unique_id";
    
    shared Element[] elements;
    
    shared String path;
    
    Layout layout;
    
    Map<String,String> properties;
    
    function preprocess(Map<String,String> properties, String markdown) {
        value preprocessRegex = regex {
            expression = """#\{(page|site\.urls)\.(\w+)\}""";
            global = true;
        };
        
        function replacement(MatchResult match) {
            value type = match.groups[0];
            value key = match.groups[1];
            
            assert (exists type, exists key);
            
            if (type == "page") {
                return properties[key] else match.matched;
            } else {
                return siteUrls[key] else match.matched;
            }
        }
        
        return preprocessRegex.replace(markdown, replacement);
    }
    
    function postprocess({Element*} elements) => [
        for (element in elements)
            if (is Raw element, element.string == "<toc>")
            then package.tableOfContents(elements)
            else element
    ];
    
    shared new fromCeylon(Layout layout, {<String->String>*} properties, Element+ elements) {
        this.layout = layout;
        this.properties = map(properties);
        this.elements = elements;
        this.path = "";
    }
    
    shared new fromMarkdown({String*} lines, String path = "", Boolean linkHeadings = false) {
        value [properties, markdown] = extractProperties(lines);
        
        this.properties = map(properties);
        this.layout = resolveResource(this.properties["layout"], "Layout", defaultLayout);
        
        value document = Parser().parse(preprocess(this.properties, markdown));
        value renderOptions = RenderOptions {
            defaultLanguage = "ceylon";
            linkHeadings = linkHeadings;
        };
        
        this.elements = postprocess(
            CeylonHtmlRenderer(renderOptions).render(document).narrow<Element>());
        this.path = path;
    }
    
    shared new fromFile(String path, File file)
            extends fromMarkdown(lines(file), path, true) {}
    
    shared String? property(String key) => properties[key] else layout.property(key);
    
    shared String author => property("author") else "";
    
    shared Integer eventDuration => parseInteger(property("event_duration") else "") else 0;
    
    shared Date eventStart => parseDate(property("effective_date") else "") else today();
    
    shared Date eventEnd => eventDuration > 1
        then eventStart.plus(Period { days = eventDuration - 1; })
        else eventStart;
    
    "Returns the value of the \"GitHub-Editable\" property, if one is present. Otherwise, calling
     code should impose whatever default is appropriate."
    shared Boolean? gitHubEditable
            => if (exists gitHubEditableProperty = property("gh_editable"))
            then parseBoolean(gitHubEditableProperty)
            else null;
    
    shared Integer level => parseInteger(property("level") else "") else 0;
    
    value markdownTitle => textContent(Parser().parse(property("title_md") else ""));
    
    shared String name => property("name") else "";
    
    shared String tab => property(keyTab) else "";
    
    shared Ul tableOfContents => package.tableOfContents(this);
    
    shared String title => property(keyTitle) else markdownTitle;
    
    shared String? uniqueId => property(keyUniqueId);
    
    shared default String uri => path.replaceLast(".md", "/");
    
    shared actual String string {
        value stringBuilder = StringBuilder();
        
        value write = void(String string) {
            value lines = string.lines;
            
            if (lines.first == ":markdown") {
                value page = fromMarkdown(lines.rest);
                
                for (element in page.elements) {
                    stringBuilder.append(element.string);
                }
            }
            else {
                stringBuilder.append(string);
            }
        };
        
        renderTemplate(layout.layout(this), write);
        
        return stringBuilder.string;
    }
}
