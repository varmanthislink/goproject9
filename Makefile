.PHONY: build run clean test

# Build the application
build:
	go build -o bin/goproject main.go

# Run the application
run:
	go run main.go

# Clean build artifacts
clean:
	rm -rf bin/

# Run tests
test:
	go test ./...

# Install dependencies
deps:
	go mod tidy

# Build for different platforms
build-all:
	mkdir -p bin
	GOOS=linux GOARCH=amd64 go build -o bin/goproject-linux-amd64 main.go
	GOOS=windows GOARCH=amd64 go build -o bin/goproject-windows-amd64.exe main.go
	GOOS=darwin GOARCH=amd64 go build -o bin/goproject-darwin-amd64 main.go
