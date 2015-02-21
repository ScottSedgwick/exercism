import timeit

print(timeit.timeit(stmt="detect_anagrams('allergy','gallery ballerina regally clergy largely leading'.split())", setup='from anagram import detect_anagrams', number=1000000))
