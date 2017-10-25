package foodchain

import (
	"fmt"
	"strings"
)

const (
	ptn_one     = "I know an old lady who swallowed a %s."
	ptn_end     = "I don't know why she swallowed the fly. Perhaps she'll die."
	ptn_why     = "She swallowed the %s to catch the %s"
	ptn_why_std = ptn_why + "."
	ptn_wriggle = "wriggled and jiggled and tickled inside her."
	TestVersion = 1
)

type exclamation func([]string, verse) []string

type verse struct {
	critter string
	exclaim exclamation
	reason  string
}

var verse_info = [...]verse{
	verse{
		critter: "fly",
		exclaim: func(values []string, _ verse) []string {
			return values
		},
		reason: "",
	},
	verse{
		critter: "spider",
		exclaim: func(values []string, _ verse) []string {
			return append(values, "It "+ptn_wriggle)
		},
		reason: ptn_why_std,
	},
	verse{
		critter: "bird",
		exclaim: func(values []string, v verse) []string {
			return append(values, fmt.Sprintf("How absurd to swallow a %s!", v.critter))
		},
		reason: ptn_why + " that " + ptn_wriggle,
	},
	verse{
		critter: "cat",
		exclaim: func(values []string, v verse) []string {
			return append(values, fmt.Sprintf("Imagine that, to swallow a %s!", v.critter))
		},
		reason: ptn_why_std,
	},
	verse{
		critter: "dog",
		exclaim: func(values []string, v verse) []string {
			return append(values, fmt.Sprintf("What a hog, to swallow a %s!", v.critter))
		},
		reason: ptn_why_std,
	},
	verse{
		critter: "goat",
		exclaim: func(values []string, v verse) []string {
			return append(values, fmt.Sprintf("Just opened her throat and swallowed a %s!", v.critter))
		},
		reason: ptn_why_std,
	},
	verse{
		critter: "cow",
		exclaim: func(values []string, v verse) []string {
			return append(values, fmt.Sprintf("I don't know how she swallowed a %s!", v.critter))
		},
		reason: ptn_why_std,
	},
	verse{
		critter: "horse",
		exclaim: func(values []string, _ verse) []string {
			return append(values, "She's dead, of course!")
		},
		reason: "",
	},
}

func opening(n int) []string {
	vinfo := verse_info[n]
	result := []string{fmt.Sprintf(ptn_one, vinfo.critter)}
	return vinfo.exclaim(result, vinfo)
}

func reason(n int) string {
	return fmt.Sprintf(verse_info[n].reason, verse_info[n].critter, verse_info[n-1].critter)
}

func Song() string {
	return Verses(1, 8)
}

func Verse(n int) string {
	result := opening(n - 1)
	if n < 8 {
		for m := n - 1; m >= 0; m-- {
			if verse_info[m].reason != "" {
				result = append(result, reason(m))
			}
		}
		result = append(result, ptn_end)
	}
	return strings.Join(result, "\n")
}

func Verses(start int, finish int) string {
	result := make([]string, finish-start+1)
	for n := start; n <= finish; n++ {
		result[n-start] = Verse(n)
	}
	return strings.Join(result, "\n\n")
}