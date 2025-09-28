run:
	mkdir -p build
	rustc main.rs -o ./build/main
	./build/main
