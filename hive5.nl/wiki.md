Wiki
====

<!-- The source of the wiki is located on [Github](https://github.com/hive5/wiki).

    - wiki
      - check.py       - Checks some Python dependencies. Used by Makefile.
      - Makefile       - Shortcuts for commands.
      - sw             - Small script that generates the wiki.
      - sw.conf        - Configuration file.
      - hive5.nl       - Pages, etc.
        - favicon.png
        - style.css

When `make hive5` is run it generates a directory, `hive5.nl.static`, which
contains all the files that can be uploaded to the webserver. -->

The source of this wiki, including scripts can be found on [Github][1].
Everything should speak for itself. It's just a Makefile, two shell scripts and
some Markdown files.

There's a few things to keep in mind when modifying the contents of this wiki.

 - Try to keep the line length in source files around 80 and below 100.
 - The first line of a Markdown file is used as the page title (the `<title>`
   tag). Leave the first line empty to use the default title.
 - [Pure][2] (CSS framework) is used for the looks of this wiki. Make use of this
   framework instead writing your own CSS if possible.
 - [Python-Markdown][3] is used to convert the Markdown to HTML. No extensions
   have been enabled yet. I'm (FSX) thinking of switching to [Hoep][4] or [Hodown][5]
   for faster conversion and more extensibility.
 - Make sure every page is viewable on devices with small display (e.g. mobile
   phones). Think of [hip][6] terms like *responsive web design*, *mobile first strategy*
   and *Web 3.0*. This guarantees our place in the modern world of the internet!


[1]: https://github.com/hive5/wiki
[2]: http://purecss.io
[3]: https://pythonhosted.org/Markdown/
[4]: https://github.com/Anomareh/Hoep
[5]: https://github.com/hoedown/hoedown
[6]: http://www.urbandictionary.com/define.php?term=hip
