hive5:
	./sw hive5.nl

clean:
	rm -rfv ./hive5.nl.static

check_markdown:
	@python ./check.py
