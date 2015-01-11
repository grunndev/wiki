Wiki
====

The source of the wiki is located on [Github](https://github.com/hive5/wiki).
Run `make hive5.nl` to compile the wiki. The output will be written to
`hive5.nl.static`.

There's a few things to keep in mind when modifying the contents of this wiki.

 - Try to keep the line length in source files around 80 and below 100.
 - The first line of a Markdown file is used as the page title (the `<title>`
   tag). Leave the first line empty to use the default title.
 - [Pure][1] (CSS framework) is used for the looks of this wiki. Make use of this
   framework instead writing your own CSS if possible.
 - [Hoep][2] is used to convert the Markdown to HTML.
 - Make sure every page is viewable on devices with small display (e.g. mobile
   phones). Think of [hip][3] terms like *responsive web design*, *mobile first strategy*
   and *Web 3.0*. This guarantees our place in the modern world of the internet!


[1]: http://purecss.io
[2]: https://github.com/Anomareh/Hoep
[3]: http://www.urbandictionary.com/define.php?term=hip
