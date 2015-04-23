package house

func Embed(relPhrase, nounPhrase string) string {
	return relPhrase + " " + nounPhrase
}

// Verse generates a verse of a song with relative clauses that have
// a recursive structure.
//
func Verse(subject string, relPhrases []string, nounPhrase string) string {
	result := subject
	for _, phrase := range relPhrases {
		result = Embed(result, phrase)
	}
	return Embed(result, nounPhrase)
}

// There are different ways to do this of course, but try using Embed as a
// subroutine and using programmatic recursion that reflects the grammatical
// recursion.

// Song generates the full text of "The House That Jack Built".  Oh yes, you
// could just return a string literal, but humor us; use Verse as a subroutine.
//
func Song() string {
	return ""
}
