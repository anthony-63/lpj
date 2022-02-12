OUT := bin/lpj
MAIN_FILE := src/main.lisp

all: $(OUT)

$(OUT): $(MAIN_FILE)
	sbcl --eval '(load "$(MAIN_FILE)")' \
    	 --eval "(sb-ext:save-lisp-and-die \"$(OUT)\" :executable t :toplevel 'main)"

run: $(OUT)
	./$(OUT)

install:
	mkdir -p /bin/lpj_assets/
	cp ./assets/template.tar /bin/lpj_assets/
	cp ./bin/lpj /bin/

