import ceylon.locale {
    Locale,
    locale
}

Locale dateLocale {
    assert (exists dateLocale = locale("en-US"));
    
    return dateLocale;
}
