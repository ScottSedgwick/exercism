package house

import (
	"strings"
)

var (
	start   = "This is"
	finish  = "the house that Jack built."
	phrases = []string{
		"the malt\nthat lay in",
		"the rat\nthat ate",
		"the cat\nthat killed",
		"the dog\nthat worried",
		"the cow with the crumpled horn\nthat tossed",
		"the maiden all forlorn\nthat milked",
		"the man all tattered and torn\nthat kissed",
		"the priest all shaven and shorn\nthat married",
		"the rooster that crowed in the morn\nthat woke",
		"the farmer sowing his corn\nthat kept",
		"the horse and the hound and the horn\nthat belonged to",
	}
)

func Embed(relPhrase, nounPhrase string) string {
	return strings.TrimSpace(strings.Join([]string{relPhrase, nounPhrase}, " "))
}

func Verse(subject string, relPhrases []string, nounPhrase string) string {
	return Embed(Embed(subject, strings.Join(relPhrases, " ")), nounPhrase)
}

func reverse(strs []string) []string {
	l := len(strs)
	result := make([]string, l)
	for index, phrase := range strs {
		result[l-index-1] = phrase
	}
	return result
	return strs
}

func Song() string {
	result := make([]string, len(phrases)+1)
	for i := 0; i <= len(phrases); i++ {
		result[i] = Verse(start, reverse(phrases[:i]), finish)
	}
	return strings.Join(result, "\n\n")
}
