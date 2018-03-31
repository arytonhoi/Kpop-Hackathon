# Written by Aryton Hoi and Matthew Todd
# for Northeastern Wireless Club's 3rd annual Hackathon
# awarded "Coolest Algorithm"
import unicodedata
import glob
import csv
import codecs

# Given a set of K-Pop lyrics, analyzes:
# 1. Percentage of lyrics that are English words
# 2. Total word count (used for other calculations)
# 3. Percentage of lyrics that are "romantic" words
# 4. Percentage of lyrics that are "aggressive/bad-boy" words
# 5. Average line length
# 6. Total number of lines (used for other calculations)
# 7. Percentage of lyrics that are unique words (basically how often words are repeated)
# 8. Percentage of times the Title of the song appears in the lyrics

# Define dictionary of "aggressive" and "romantic" words
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

# Calculates the percentage of lyrics that are English words
def englishWordPercentage(lyrics):
    counter = 0
    for line in lyrics:
        for word in line.split(" "):
            if len(word) > 0 and (ord(str(word[0]))) <= 122:
                counter += 1
    return counter / float(countTotalWords(lyrics)) * 100

# Calculates total word count (used for other calculations)
def countTotalWords(lyrics):
    counter = 0
    #print(lyrics)
    for line in lyrics:
        if not len(line) == 0:
            counter += len(line.split(" "))
    return counter

# Calculates percentage of lyrics that are "romantic" words
def romanticWordPercentage(lyrics):
    counter = 0
    for line in lyrics:
        for word in line.split(" "):
            if word in romantic:
                counter += 1
    return counter / float(countTotalWords(lyrics)) * 100

# Calculates percentage of lyrics that are "aggressive/bad-boy" words
def badWordPercentage(lyrics):
    counter = 0
    for line in lyrics:
        for word in line.split(" "):
            if word in bad:
                counter += 1
    return counter / float(countTotalWords(lyrics)) * 100

# Calculates the total number of lines (used for other calculations)
def countLines(lyrics):
    return len(lyrics) - 1

# Calculates the average line length
def findAvgLineLength(lyrics):
    return countTotalWords(lyrics) / float(countLines(lyrics))

# Calculates the percentage of lyrics that are unique words (basically how often words are repeated)
def uniqueWordsPercentage(lyrics):
    unique = []
    for line in lyrics:
        for word in line.split(" "):
            if word not in unique:
                unique.append(word)
    return float(len(unique)) / countTotalWords(lyrics) * 100

# Calculates the percentage of times the Title of the song appears in the lyrics
def titlePercentage(lyrics):
    counter = 0
    title = lyrics[1].casefold()
    for line in lyrics:
        counter += line.casefold().count(title)
    return ((counter - 1) * len(title.split(" "))) / float(countTotalWords(lyrics)) * 100

def main(filename):
    # Declare arrays to store lyrics, training data, and testing data
    lyrics = []
    output_train = []
    output_test = []

    # Open and read lyric txt stored in the ./lyrics_train folder and add each line to the lyrics array
    file = codecs.open(filename, "r")
    fileline = file.readlines()
    for line in fileline:
        lyrics.append(line.replace('\n', ""))

    # Add every fifth lyric-analysis array to the testing set array
    # the other lyric-analysis arrays are added to the training set array
    # Approximately 80/20% split between the size of training/testing sets
    if not which_file % 5 == 0:
        # Build training data set based on lyric analysis functions
        output_train.append(englishWordPercentage(lyrics))
        output_train.append(romanticWordPercentage(lyrics))
        output_train.append(badWordPercentage(lyrics))
        output_train.append(findAvgLineLength(lyrics))
        output_train.append(uniqueWordsPercentage(lyrics))
        output_train.append(titlePercentage(lyrics))

        # Append the artist label (TWICE, BTS, IU -> 0, 1, 2) to the end of each line
        # of lyrics features in the training and testing sets
        if "twice" in filename:
            output_train.append(0)
        elif "BTS" in filename:
            output_train.append(1)
        elif "IU" in filename:
            output_train.append(2)
        # Add the features of the lyric analysis as a row in the training set
        trainingSet.append(output_train)
    else:
        # Build testing data set based on lyric analysis functions
        output_test.append(englishWordPercentage(lyrics))
        output_test.append(romanticWordPercentage(lyrics))
        output_test.append(badWordPercentage(lyrics))
        output_test.append(findAvgLineLength(lyrics))
        output_test.append(uniqueWordsPercentage(lyrics))
        output_test.append(titlePercentage(lyrics))

        # Append the artist label (TWICE, BTS, IU -> 0, 1, 2) to the end of each line
        # of lyrics features in the training and testing sets
        if "twice" in filename:
            output_test.append(0)
        elif "BTS" in filename:
            output_test.append(1)
        elif "IU" in filename:
            output_test.append(2)
        # Add the features of the lyric analysis as a row in the testing set
        testingSet.append(output_test)

# define artist categories
categories = ["twice", "BTS","IU"]
numFeatures = 6

# declare training set, testing set arrays
trainingSet = []
testingSet = []

# keep track of which file in the ./lyrics_train folder we're looking at
which_file = 1

# iterate through the files in the ./lyrics_train folder
for file in glob.glob("lyrics_train/*.txt"):
    main(file)
    which_file += 1

# Write and format training set array to training_data.csv
with open('training_data.csv', 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        trainingHeader = [len(trainingSet), numFeatures]
        for category in categories:
            trainingHeader.append(category)
        csvwriter.writerow(trainingHeader)
        for row in trainingSet:
            csvwriter.writerow(row)

# Write and format training set array to testing_data.csv
with open('testing_data.csv', 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        testingHeader = [len(testingSet), numFeatures]
        for category in categories:
            testingHeader.append(category)
        csvwriter.writerow(testingHeader)
        for row in testingSet:
            csvwriter.writerow(row)