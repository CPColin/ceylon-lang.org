import ceylon.html {
    A,
    Div,
    H1,
    H2,
    H3,
    Img
}

import org.ceylonlang.site.layouts {
    communityLayout
}
import org.ceylonlang.site.util {
    events
}

String eventName(Page page) => page.property("event") else "";

String eventLocation(Page page) => page.property("location") else "";

String eventPresenter(Page page)
        => page.property("presenter") else page.property("presentor") else "";

String? eventUrl(Page page) => page.property("event_url");

shared object eventsPage extends Page.fromCeylon(
    communityLayout,
    [
        Page.keyTab->"community",
        Page.keyTitle->"Events where we talk about Ceylon",
        Page.keyUniqueId->"communitypage"
    ],
    Div {
        id = "upcoming-talks";
        H1 {
            "Events where we talk about Ceylon"
        },
        *expand {
            for (event in events) {
                Div {
                    clazz = "item";
                    Div {
                        clazz = "event_details";
                        Div {
                            clazz = "event_date";
                            event.eventStart.string,
                            if (event.eventDuration > 1)
                                then " to ``event.eventEnd.string``"
                                else null
                        },
                        Div {
                            clazz = "event_location";
                            event.property("event_location")
                        }
                    },
                    H2 {
                        A {
                            href = eventUrl(event);
                            eventName(event)
                        }
                    },
                    if (exists logoUrl = event.property("event_logo_url"))
                        then A {
                            href = eventUrl(event);
                            Img {
                                clazz = "event_logo";
                                src = logoUrl;
                            }
                        }
                        else null,
                    H3 {
                        event.title
                    },
                    Div {
                        clazz = "details";
                        "``eventPresenter(event)`` will present at ``eventName(event)`` in ``eventLocation(event)``"
                    },
                    Div {
                        clazz = "details";
                        event.elements.withTrailing(A {
                            href = eventUrl(event);
                            "More about ``eventName(event)``"
                        })
                    }
                }
            }
        }
    }
) {}
