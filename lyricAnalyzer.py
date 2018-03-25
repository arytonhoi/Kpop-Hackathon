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
lyrics = []

bad = ['섹스', '성적', '그것을 하다', '바람피우다', '차다', '집적대다']

romantic = ['사랑해요', '당신을 좋아해요', '별일 없지', '하고 싶어요', 'baby',\
            '하고 싶어', '친절하시군요', '주실래요', '결혼해', '당신과', '함께하고', \
            '애정', '눈물', '같애', '심장', 'love', '아름다운', '응시', '끌려', '머리', \
            '마음에', '좋아하다', '키스', '남자 친구', '보이 프렌드', '여자 친구', '꿈꾸던', \
            'kiss', '관심', '연애편지', '짝사랑', '맞선', '내 가장 친한 친구', '연인', \
            '연애', '애인', '자기야', '자기', '사귀다', '운명', '영원토록', '미팅', \
            '소개팅', '원나잇 스탠드', '뽀뽀', '키스', '사랑에', '첫사랑', '여보', \
            '반하다', '첫눈에', '있어줘', '화장', '자다']

def englishWordPercentage():
    counter = 0
    for line in lyrics:
        for word in line.split(" "):
            if len(word) > 0 and (ord(str(word[0]))) <= 122:
                counter += 1
    return counter / float(countTotalWords()) * 100


def countTotalWords():
    counter = 0
    for line in lyrics:
        counter += len(line.split(" "))
    return counter


def romanticWordPercentage():
    counter = 0
    for line in lyrics:
        for word in line.split(" "):
            if word in romantic:
                counter += 1
    return counter / float(countTotalWords()) * 100

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
    return float(len(unique)) / countTotalWords() * 100


def titlePercentage():
    counter = 0
    title = lyrics[0].casefold()
    for line in lyrics:
        counter += line.casefold().count(title)
    return (counter - 1) / float(countTotalWords()) * 100


def main():
    output = []
    f = open("lyrics3.txt", "r")
    fl = f.readlines()
    for x in fl:
        lyrics.append(x.replace('\n', ""))
    # print(lyrics)
    output.append(englishWordPercentage())
    output.append(countTotalWords())
    output.append(romanticWordPercentage())
    output.append(countLines())
    output.append(findAvgLineLength())
    output.append(uniqueWordsPercentage())
    output.append(titlePercentage())
    print(output)


main()
