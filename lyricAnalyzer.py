'''
Given a set of lyrics, analyzes:
- # English words
- Total words
- obscene words
- #lines
- Average line length
- % unique words
- # Title occurrences in lyrics


def countEnglishWords(...){
    ...
}

def countTotalWords(){

}

def countObsceneWords(){

}

def countLines(){

}

def findAvgLineLength(){

}

def uniqueWordsPercentage(){

}

def countTitleOccurs(){

}
'''
def main():
    f= open("lyrics.txt", "r")
    fl = f.readlines()
    for x in fl:
        print(x)

if __name__=="__main__":
    main()
