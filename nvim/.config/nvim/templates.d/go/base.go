package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Sprintf("Hello, %s!", os.Getenv("USER"))
}
