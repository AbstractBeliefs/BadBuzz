DIRECTORIES = Python

test:
	$(foreach dir, $(DIRECTORIES), $(MAKE) -C $(dir))
