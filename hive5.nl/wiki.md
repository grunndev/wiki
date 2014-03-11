Wiki
====

The source of the wiki is located on [Github](https://github.com/hive5/wiki).

    - wiki
      - check.py       - Checks some Python dependencies. Used by Makefile.
      - Makefile       - Shortcuts for commands.
      - sw             - Small script that generates the wiki.
      - sw.conf        - Configuration file.
      - hive5.nl       - Pages, etc.
        - favicon.png
        - style.css

When `make hive5` is run it generates a directory, `hive5.nl.static`, which
contains all the files that can be uploaded to the webserver.
