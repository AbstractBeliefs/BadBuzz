FILES = $(wildcard *.py)

test:
	$(foreach testable, $(FILES), echo "Testing $(testable)"; ./$(testable) | diff -i - ../fizzbuzz.txt;)
