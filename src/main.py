import os
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from collections import Counter
from itertools import combinations
import string


def get_txt_files(directory):
        return [f for f in os.listdir(directory) if f.endswith('.txt')]

def preprocess_text(file_path, stop_words):
    
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            text = file.read()
    except UnicodeDecodeError:
        with open(file_path, 'r', encoding='latin-1') as file:
            text = file.read()
    
        text = text.lower()
    
    words = word_tokenize(text)
    
    table = str.maketrans('', '', string.punctuation)
    stripped_words = [word.translate(table) for word in words]
    
    filtered_words = [word for word in stripped_words if word.isalpha() and word not in stop_words]
    
    word_counts = Counter(filtered_words)
    
    top_words = word_counts.most_common(200)
    
    total_count = sum(count for word, count in top_words)
    if total_count == 0:
        return {}
    normalized_freq = {word: count / total_count for word, count in top_words}
    
    return normalized_freq

def calculate_similarity(file_freqs):
    
    similarity_scores = []
    file_pairs = combinations(file_freqs.keys(), 2)
    
    for file1, file2 in file_pairs:
        freq1 = file_freqs[file1]
        freq2 = file_freqs[file2]
        
        common_words = set(freq1.keys()).intersection(set(freq2.keys()))
        
        similarity = sum(freq1[word] + freq2[word] for word in common_words)
        
        similarity_scores.append(((file1, file2), similarity))
    
    similarity_scores.sort(key=lambda x: x[1], reverse=True)
    
    return similarity_scores

def main():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    
    text_files_dir = os.path.join(current_dir, '..', 'text_files')
    
    if not os.path.isdir(text_files_dir):
        print(f"Error: The directory '{text_files_dir}' does not exist.")
        return
    
    txt_files = get_txt_files(text_files_dir)
    
    if not txt_files:
        print("No .txt files found. Exiting program.")
        return
    
    stop_words = set(stopwords.words('english'))
    
    file_freqs = {}
    
    print("Preprocessing files...")
    for file_name in txt_files:
        file_path = os.path.join(text_files_dir, file_name)
        normalized_freq = preprocess_text(file_path, stop_words)
        if normalized_freq:
            file_freqs[file_name] = normalized_freq
        else:
            print(f"Warning: '{file_name}' has no valid words after preprocessing.")
    
    
    N = int(input("Enter the number of most similar pairs to report: "))
    
    print("Calculating similarity scores...")
    similarity_scores = calculate_similarity(file_freqs)
    
    num_pairs_to_report = min(N, len(similarity_scores))
    
    print(f"\nTop {num_pairs_to_report} most similar pairs of textbooks:\n")
    for (file1, file2), score in similarity_scores[:num_pairs_to_report]:
        print(f"{file1} and {file2} with similarity index: {score - 1:.4f}")

if __name__ == "__main__":
    main()
