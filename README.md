Grunndev Wiki
=============

All the sources of the Grunndev website/wiki (grunndev.nl).


Usage
-----

The Makefile contains the following commands:

- all (default): builds the website.
- clean: removes the build output.
- serve: serve the build output using Python 3's `http.server` module.

Options:

 - url: set the base URL (e.g. `url='http:\/\/grunndev.nl'`). Slashes must
   be escaped as this value is put into a sed expression. The default
   value is `http:\/\/0.0.0.0:8000`.

Examples:

```
make
make serve
make clean serve
make url='http:\/\/grunndev.nl' clean all
```


Dependencies
------------

- GNU Make
- [cmark](https://github.com/jgm/cmark)
- Python 3 (optional, only used for `make serve`)


Adding new content!
-------------------

**A markdown document:**

1. Create a new markdown file in `source/`.
2. The first line of this file is put into the `<title>` tags of the
   generated HTML document and is ignored by cmark.
3. After the first line you can put the contents of the document.
4. Add the filename in the `md` array in the Makefile.
5. Optional: Add a link in the menu (`source/_header.html`) or another
   document.

`{{url}}` is replaced with the value set in the `url` option of the
Makefile.

**A file:**

1. Add the new file in `source/`.
2. Add the filename in the `files` array in the Makefile.


`_header.html` and `_footer.html`
---------------------------------

The contents of these two files are wrapped around the HTML that's
generated from the markdown files.

The following strings are replaced with different string:

- `{{url}}` is replaced with the value set in the `url` option of the Makefile.
- `{{random}}` is replaced with a random number.
- `{{title}}` is replaced with the title of the current document.


Quirks
------

- Changing `_header.html` or `_footer.html` doesn't trigger a rebuild.
  Use `make clean all`.
