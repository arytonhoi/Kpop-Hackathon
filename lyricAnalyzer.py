import unicodedata
import glob
import csv
import codecs

'''
Given a set of lyrics, analyzes:
- # English words
- Total words
- obscene words
- #lines
- Average line length
- percent unique words
- # Title occurrences in lyrics
'''

bad = ['섹스', '성적', '그것을 하다', '바람피우다', '차다', '집적대다', 'sexy', 'enemy',\
       'bad', 'girl', 'style', 'type', 'party', '오빠', '괜히', '남자', '미친',\
       '여자는', '여자', '몸', '치게', '아파', '장난', '위험', 'swagger', 'swaggin', '미쳤어',\
       '외쳐', '예뻐', '소년']

romantic = ['사랑해요', '당신을 좋아해요', '별일 없지', '하고 싶어요', 'baby',\
            '하고 싶어', '친절하시군요', '주실래요', '결혼해', '당신과', '함께하고', \
            '애정', '눈물', '같애', '심장', 'love', '아름다운', '응시', '끌려', '머리', \
            '마음에', '좋아하다', '키스', '남자 친구', '보이 프렌드', '여자 친구', '꿈꾸던', \
            'kiss', '관심', '연애편지', '짝사랑', '맞선', '내 가장 친한 친구', '연인', \
            '연애', '애인', '자기야', '자기', '사귀다', '운명', '영원토록', '미팅', \
            '소개팅', '원나잇 스탠드', '뽀뽀', '키스', '사랑에', '첫사랑', '여보', \
            '반하다', '첫눈에', '있어줘', '화장', '자다']

def englishWordPercentage(lyrics):
    counter = 0
    for line in lyrics:
        for word in line.split(" "):
            if len(word) > 0 and (ord(str(word[0]))) <= 122:
                counter += 1
    return counter / float(countTotalWords(lyrics)) * 100

def countTotalWords(lyrics):
    counter = 0
    #print(lyrics)
    for line in lyrics:
        if not len(line) == 0:
            counter += len(line.split(" "))
    return counter

def romanticWordPercentage(lyrics):
    counter = 0
    for line in lyrics:
        for word in line.split(" "):
            if word in romantic:
                counter += 1
    return counter / float(countTotalWords(lyrics)) * 100

def badWordPercentage(lyrics):
    counter = 0
    for line in lyrics:
        for word in line.split(" "):
            if word in bad:
                counter += 1
    return counter / float(countTotalWords(lyrics)) * 100

def countLines(lyrics):
    return len(lyrics) - 1

def findAvgLineLength(lyrics):
    return countTotalWords(lyrics) / float(countLines(lyrics))


def uniqueWordsPercentage(lyrics):
    unique = []
    for line in lyrics:
        for word in line.split(" "):
            if word not in unique:
                unique.append(word)
    return float(len(unique)) / countTotalWords(lyrics) * 100


def titlePercentage(lyrics):
    counter = 0
    title = lyrics[1].casefold()
    for line in lyrics:
        counter += line.casefold().count(title)
    return ((counter - 1) * len(title.split(" "))) / float(countTotalWords(lyrics)) * 100


def main(filename):
    lyrics = []
    output_train = []
    output_test = []
    file = codecs.open(filename, "r")
    fileline = file.readlines()
    for line in fileline:
        #print(line)
        lyrics.append(line.replace('\n', ""))
    #print(lyrics)
    if not which_file % 5 == 0:
        output_train.append(englishWordPercentage(lyrics))
        output_train.append(romanticWordPercentage(lyrics))
        output_train.append(badWordPercentage(lyrics))
        output_train.append(findAvgLineLength(lyrics))
        output_train.append(uniqueWordsPercentage(lyrics))
        output_train.append(titlePercentage(lyrics))
        trainingSet.append(output_train)
        #print(trainingSet)
        if "twice" in filename:
            trainingAns.append(0)
        elif "BTS" in filename:
            trainingAns.append(1)
        elif "IU" in filename:
            trainingAns.append(2)
    else:
        output_test.append(englishWordPercentage(lyrics))
        output_test.append(romanticWordPercentage(lyrics))
        output_test.append(badWordPercentage(lyrics))
        output_test.append(findAvgLineLength(lyrics))
        output_test.append(uniqueWordsPercentage(lyrics))
        output_test.append(titlePercentage(lyrics))
        testingSet.append(output_test)
        #print(trainingSet)
        if "twice" in filename:
            testingAns.append(0)
        elif "BTS" in filename:
            testingAns.append(1)
        elif "IU" in filename:
            testingAns.append(2)

trainingSet = []
testingSet = []
trainingAns = []
testingAns = []
which_file = 1

for f in glob.glob("lyrics_train/*.txt"):
    main(f)
    which_file += 1

with open('training_data.csv', 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        for row in trainingSet:
            csvwriter.writerow(row)
        csvwriter.writerow(trainingAns)

with open('testing_data.csv', 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        for row in testingSet:
            csvwriter.writerow(row)
        csvwriter.writerow(testingAns)