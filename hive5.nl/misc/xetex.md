XeTeX/LaTeX
===========

LaTeX is awesome, but I (FSX) always forget how to setup a document. This page
describes a simple setup for a LaTeX document. If something is wrong or incomplete:
send a pull request to the [git repository][1].


Structure
---------

Just a few files and directories are needed. **src/** contains all the TeX files
(the only TeX file that's required is **main.tex**). **config.mk** and **Makefile**
are used to compile the document.

    - your_document/
      - src/
        - main.tex
      - config.mk
      - Makefile


Makefile
--------

[make][2] is used to run all the tasks like compiling, cleaning and packaging.
**Makefile** shouldn't be changed, **config.mk** is used for that purpose.
Below are the commands/tasks and the contents of **config.mk** and **Makefile**.

**Commands/Tasks**

    all     - Runs the task that's defined in DEFAULT_TASK, config.mk
    debug   - Compile document with DEBUG_FLAGS
    release - Compile document with RELEASE_FLAGS
    source  - Package all source files
    clean   - Remove all files that are created after compiling

**config.mk**

    NAME=onderzoeksvragen
    DEFAULT_TASK=debug

    define DEBUG_FLAGS
    \def\debug{1}
    endef

    define RELEASE_FLAGS
    % None
    endef

**Makefile**

    include config.mk

    .PHONY: all debug release source clean

    FLAGS_FILE=src/flags.tex

    define set_debug_mode
        echo "$(DEBUG_FLAGS)" > "$(FLAGS_FILE)"
    endef

    define set_release_mode
        echo "$(RELEASE_FLAGS)" > "$(FLAGS_FILE)"
    endef

    define compile
        [ -f $(FLAGS_FILE) ] || touch "$(FLAGS_FILE)"
        xelatex -interaction=nonstopmode -jobname="$(1)" $(2) && \
            xelatex -interaction=nonstopmode -jobname="$(1)" $(2)
    endef

    define archive_build
        @mkdir -p ./build/$(1)
        cp "./$(2).pdf" "./build/$(1)/$(2)_$(3).pdf"
        echo "Result: ./build/$(1)/$(2)_$(3).pdf"
    endef

    define package_source
        mkdir -p ./build/source
        tar -Jcvf "./build/source/$(1)_$(2).tar.xz" \
            --exclude=./build \
            --exclude=./.~lock* \
            --exclude=./*.okular \
            --exclude=./*.pdf \
            --exclude=./*.sublime* \
            --exclude=./*.log \
            --exclude=./src/flags.tex \
            ./
        echo "Result: ./build/source/$(1)_$(2).tar.xz"
    endef

    all: ${DEFAULT_TASK}

    debug:
        @$(call set_debug_mode)
        @$(call compile,"$(NAME)",src/main.tex)

    release:
        @$(call set_release_mode)
        @$(call compile,"${NAME}",src/main.tex)
        @$(call archive_build,release,$(NAME),$(shell date +%Y-%m-%d_%H%M%S))

    source: clean
        @$(call package_source,$(NAME),$(shell date +%Y-%m-%d_%H%M%S))

    clean:
        @rm -vf src/*.aux \
            *.aux *.log *.toc \
            *.pdf *.out *.fls \
            *.synctex.gz


main.tex
--------

This file contains the setting of the document. Packages are imported and configured
here and other parts are included here (see `\include{src/titel}`).

    \InputIfFileExists{src/flags}{}{}

    \documentclass[a4paper,11pt]{report}
    \usepackage[log-declarations=false]{xparse}
    \usepackage{url}
    \usepackage{parskip}
    \usepackage{hyperref}
    \usepackage{fontspec}
    \usepackage{polyglossia}

    % Space between table rows
    \renewcommand{\arraystretch}{1.5}

    % Language
    \setdefaultlanguage[babelshorthands=true]{dutch}

    % Fonts
    \defaultfontfeatures{Ligatures=TeX}
    % \setmainfont{TeX Gyre Heros}
    \setmainfont{Myriad Pro}
    \setmonofont[Scale=MatchUppercase]{DejaVu Sans Mono}

    % Aliases
    \newcommand{\fnm}{\footnotemark}
    \newcommand{\fnt}{\footnotetext}

    % Contents
    \begin{document}
    Document contents here.
    %\include{src/titel}
    \end{document}


Changelog
---------

 - 2014-03-27, FSX: Added page.


[1]: https://github.com/hive5/wiki
[2]: https://www.gnu.org/software/make/
