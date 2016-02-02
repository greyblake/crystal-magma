CRYSTAL_BIN ?= $(shell which crystal)
ICR_BIN ?= $(shell which icr)

build:
	$(CRYSTAL_BIN) build --release -o bin/magma src/magma.cr $(CRFLAGS)
clean:
	rm -f ./bin/magma
