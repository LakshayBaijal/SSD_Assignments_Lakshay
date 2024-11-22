#Lakshay Baijal #SSD
#2024202006 Assignment 3
##README.md

## 1) Text Preprocessing

Each .txt file undergoes a series of preprocessing steps to prepare the text for analysis:

- Lowercasing: Converts all text to lowercase to ensure uniformity.
- Tokenization: Splits the text into individual words using NLTK's word_tokenize.
- Punctuation Removal: Strips punctuation marks from each token to focus solely on words.
- Stopword Removal: Eliminates common English stopwords (e.g., "the", "is", "and") that may not contribute significantly to the analysis.
- Alphabetic Filtering: Retains only purely alphabetic tokens, discarding numbers and symbols.
- Frequency Counting: Identifies and counts the top 200 most frequent words in each document.
- Normalization: Calculates the relative frequency of each of the top words by dividing by the total count of these words.

## 2) Similarity Calculation

After preprocessing, the script calculates the similarity between every pair of documents:

- Common Words Identification: Determines the set of words shared between two documents.

- Similarity Index Computation: Sums the normalized frequencies of these common words to produce a similarity score.

- Similarity Index = ∑Common Words ( freq1[word] + freq2[word] )

- Ranking: Sorts all document pairs based on their similarity scores in descending order

## 3. Output

The script outputs the top N most similar pairs of documents, displaying each pair alongside their calculated similarity index. Higher scores indicate a greater degree of similarity based on shared significant vocabulary.


