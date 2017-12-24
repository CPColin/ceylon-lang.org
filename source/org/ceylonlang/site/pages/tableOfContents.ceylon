import ceylon.collection {
    LinkedList,
    MutableList
}
import ceylon.html {
    A,
    H2,
    H3,
    H4,
    H5,
    H6,
    Li,
    Ul
}

import org.ceylonlang.site.util {
    Element
}

// TODO: move to util?
Ul tableOfContents(Page|{Element*} pageOrElements) {
    class Finished() {}
    alias Heading => H2|H3|H4|H5|H6;
    
    function level(Heading|Finished element)
            => switch (element)
                // Skip H1 elements
                case (is H2) 2
                case (is H3) 3
                case (is H4) 4
                case (is H5) 5
                case (is H6) 6
                case (is Finished) 0;
    
    value pendingAnchors = LinkedList<A>();
    value pendingItems = LinkedList<MutableList<Li>>({LinkedList<Li>()});
    
    void visit(<Heading|Finished>[2] elements) {
        value [current, next] = elements;
        
        assert (is Heading current);
        
        value currentLevel = level(current);
        value nextLevel = level(next);
        value anchor = current.children.first;
        
        assert (is A anchor);
        
        if (nextLevel > currentLevel) {
            // Next heading is at a higher level, so we have to push the current anchor onto the
            // pendingAnchor stack and a fresh list onto the pendingItems stack.
            pendingAnchors.push(anchor);
            pendingItems.push(LinkedList<Li>());
        } else {
            pendingItems.top?.add(Li { anchor });
            
            if (nextLevel < currentLevel) {
                // We're done with the current level, because the next heading is at a lower level
                // or because we're completely done.
                value pendingAnchor = pendingAnchors.pop();
                
                if (exists pendingAnchor) {
                    // Create an Li element that combines the pending anchor with an Ul element
                    // containing the current level's items.
                    value items = pendingItems.pop();
                    
                    assert (exists items);
                    
                    pendingItems.top?.add(Li { pendingAnchor, Ul { items } });
                } else {
                    // We're at the top level. Leave the pending items on the stack so the calling
                    // code can make a Ul element with them.
                }
            }
        }
    }
    
    [
        for (element in (if (is Page pageOrElements) then pageOrElements.elements else pageOrElements))
            if (is Heading element)
                element
    ].withTrailing(Finished()).paired.each(visit);
    
    if (exists items = pendingItems.top) {
        return Ul { items };
    } else {
        return Ul {};
    }
}
