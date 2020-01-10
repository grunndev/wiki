md := index.md
md += archive.md
md += members.md

files := css/pure-custom-min.css
files += css/main.css
files += images/logo.png
files += favicon.png
files += favicon-l.png

url ?= http:\/\/0.0.0.0:8000

targets := $(addprefix build/,$(patsubst %.md,%.html,$(md)))
targets += $(addprefix build/,$(files))

all: build $(targets)

clean:
	@rm -rv build

serve: all
	cd build && python3 -m http.server

build/%.html: source/%.md
	@mkdir -p $(dir $@)
	@echo "cmark  $(<:source/%=%)"
	@cat source/_header.html > $@.tmp
	@sed -i '' "s/{{title}}/$$(head -n1 $<)/g" $@.tmp
	@sed -i '' "s/{{url}}/$(url)/g" $@.tmp
	@sed -i '' "s/{{random}}/$$(shuf -i 0-1000 -n 1)/g" $@.tmp
	@sed '1d' $< | sed "s/{{url}}/$(url)/g" | cmark --unsafe >> $@.tmp
	@cat source/_footer.html >> $@.tmp
	@mv $@.tmp $@

build/%: source/%
	@echo "copy   $(<:source/%=%)"
	@test -d $$(dirname $@) || mkdir -p $$(dirname $@) && cp -r $< $@

build:
	@mkdir build

.PHONY: all clean serve install
