import org.ceylonlang.site.layouts {
    defaultLayout
}

shared object notFoundPage extends Page.fromCeylon(
    defaultLayout,
    empty,
    ":markdown
     # Oh no!
     
     We can't seem to find that page.  
     Let us know where we screwed up by 
     [opening a ticket](https://github.com/eclipse/ceylon-lang.org/issues) and mentioning which 
     page you came from and which link you clicked on. Otherwise, best is to hit the good old back button or start back at the [top
     of the site](/)."
) {}
