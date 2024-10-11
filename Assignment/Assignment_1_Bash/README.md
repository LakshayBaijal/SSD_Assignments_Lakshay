SOFTWARE SYSTEM DEVELOPMENT - Monsoon – 2024
Assignment 1 – Shell Programming & SQL
Lakshay Baijal             2024202006

Q1)

- Remove Empty Lines:
The script removes any empty lines from the quotes.txt file and outputs the cleaned list to quotes_empty.txt.
Used NF to ignore empty lines.

- Remove Duplicate Quotes:
It then removes duplicate quotes from quotes.txt and saves the result in quotes_rdup.txt.
Sorted the file and then used Uniq and saved in Quotes_rdup.txt

- Count Quotes by Each Personality:
The script counts the number of quotes attributed to each personality and outputs the results to quotes_byperson.txt.
F tells operator to use '~' for field seperator.
$NF: In awk, $NF represents the last field after the separator. In this case, it's the name of the person who said the quote.
print $NF will print the last field and store in output file.

- List Words Starting with 's' Not Followed by 'a':
The script extracts words starting with 's' but not followed by 'a' and lists them in words_starting_with_s.txt.
Iterating every word using for loop and checking whether the word starts with s and ignore if it starts with a.

Implementation use ./Q1.sh


Q2)
Part 1: Password and Account Number Generator
The script generates a password with a length of 8 to 10 characters. 
The password contains at least one uppercase letter, one lowercase letter, and one special symbol from %&#$@()!.

Ranging Random Length of Password from 8/10 using Random of 3.
tr -dc filters random value of 1 Uppercase , 1 Lowercase and 1 special character.
After that filling the password with random characters by subtracting length excluding size = 3.
fold -w1 will break the password into every character.
Shuf will shuffle all characters.
tr -d will combine all the characters together.

Part 2: Generating the Account Number
The script generates a Account Number with a length of 12 to 14 characters. 
While loop used so that it loops continuously generates and checks the account number until a valid one is found.
tr -dc filters 1 digit that will always be non zero.
And add Remaining digits through  will be 0-9.

Validate inside loop if the pattern doesnt contain duplicates or fibonacci by using conditions.
If the conditions are not applicable then break the loop and print account number.


This script generates a secure password and a valid bank account number according to the specified requirements. The password contains a mix of uppercase letters, 
lowercase letters, special characters, and the account number is generated with specific checks to ensure it meets the conditions.

Implementation use ./Q2.sh


Q3) 
Create an array to hold directory names and sizes
Loop through each item in the current directory and check if it is a directory
Print the directory names and their sizes sorted by size

Implementation use ./Q3.sh (Store Q3.sh where Directories are present)

Q4) 
mkdir -p is used to create directories if not exist.
touch temp_activity/temp{1..50} creates empty files tempi.sh i from 1 to 50 if not exist.
rename is a command used to rename files according to a specified pattern.
's/\.sh$/.txt/' is a regular expression used to replace the .sh extension with .txt.


Implementation use ./Q3.sh (Install Rename in terminal if not present)
