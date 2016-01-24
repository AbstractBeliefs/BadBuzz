FILES = $(wildcard *.py)

test:
	$(foreach testable, $(FILES), echo "Testing $(testable)"; python $(testable) | diff - ../fizzbuzz.txt;)
