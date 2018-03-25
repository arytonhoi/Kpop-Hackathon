import unicodedata
'''
Given a set of lyrics, analyzes:
- # English words
- Total words
- obscene words
- #lines
- Average line length
- % unique words
- # Title occurrences in lyrics
'''
lyrics = [];

def countEnglishWords():
  counter = 0
  for line in lyrics:
  	for word in line.split(" "):
  		if len(word) > 0 and (ord(str(word[0]))) <= 122:
  			counter += 1
  return counter

def countTotalWords():
	counter = 0
	for line in lyrics:
		for word in line.split(" "):
			counter += len(word)
	return counter

#def countObsceneWords():

def countLines():
	return len(lyrics) - 1

def findAvgLineLength():
	return countTotalWords() / float(countLines())

def uniqueWordsPercentage():
	unique = []
	for line in lyrics:
		for word in line.split(" "):
			if word not in unique:
				unique.append(word)
	return  float(len(unique)) / countTotalWords() * 100

def countTitleOccurs():
	counter = 0
	title = lyrics[0].casefold()
	for line in lyrics:
		counter += line.casefold().count(title)
	return counter - 1

def main():
	final = []
	f= open("lyrics.txt", "r")
	fl = f.readlines()
	for x in fl:
		lyrics.append(x.replace('\n', ""))
  #print(lyrics)
  final.append(countEnglishWords())
  final.append(countTotalWords())
  final.append(countObsceneWords())
  final.append(countLines())
  final.append(findAvgLineLength())
  final.append(uniqueWordsPercentage())
  final.append(countTitleOccurs())
  print(final)
main()