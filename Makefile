DIRECTORIES = Python

test:
	$(foreach dir, $(DIRECTORIES), echo "Testing $(dir)"; $(MAKE) -C $(dir);)
