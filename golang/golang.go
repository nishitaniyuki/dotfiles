package golang

import "context"

const (
	version  = "1.10.1"
	packages = []string{
		// general usage
		"github.com/junegunn/fzf/...",
		"github.com/motemen/ghq",

		// go cmd
		"golang.org/x/tools/cmd/benchcmp",
		"golang.org/x/tools/cmd/godoc",
		"golang.org/x/tools/cmd/goimports",
		"golang.org/x/tools/cmd/present",

		// golang dev
		"github.com/golang/lint/golint",
		"github.com/jstemmer/gotags",
		"github.com/nsf/gocode",
	}
)

func Update(ctx context.Context) error {
}
