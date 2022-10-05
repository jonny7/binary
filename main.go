package main

import "fmt"

var CommitHash string
var BuildTS string

func main() {
	fmt.Println("commit has:", CommitHash)
	fmt.Println("build time stamp:", BuildTS)
	fmt.Println("goodbye")
}
