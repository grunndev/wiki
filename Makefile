all: hive5.nl

hive5.nl:
	./sw hive5.nl

clean:
	rm -rfv ./hive5.nl.static

check_markdown:
	@python3 ./check.py

.PHONY: all hive5.nl clean check_markdown
