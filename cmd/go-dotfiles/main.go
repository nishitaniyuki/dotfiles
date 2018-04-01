package main

import (
	"flag"
	"log"

	"github.com/fatih/color"
	"github.com/nishitaniyuki/dotfiles/golang"
)

var (
	goFlag bool
)

func init() {
	flag.BoolVar(&goFlag, "go", True, "handle go related dev env")
}

func main() {
	// run all
	if flag.NFlag() == 0 {
		if err := golang.Run(); err != nil {
			log.Printf("%v %v", color.RedString("[error]"), err)
		}
		return
	}
}
