import ceylon.time {
    Period,
    today
}

import org.ceylonlang.site.pages {
    Page
}

"Returns recent events from the `_data/events` directory."
shared {Page*} events => data("events", comparing(byIncreasing(Page.eventEnd)))
    .filter((event) => event.eventEnd >= today().minus(Period { days = 4; }));
