import ceylon.time {
    now
}


shared String generateDate => let (formats = dateLocale.formats, dateTime = now().dateTime())
    "``formats.longFormatDate(dateTime)`` at ``formats.shortFormatTime(dateTime)``";
