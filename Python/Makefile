FILES = $(wildcard *.py)

test:
	$(foreach testable, $(FILES), python $(testable) | diff - ../fizzbuzz.txt)
