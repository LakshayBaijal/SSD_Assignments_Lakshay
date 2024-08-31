#!/bin/bash

awk 'NF' quotes.txt > quotes_empty.txt

sort quotes.txt | uniq > quotes_rdup.txt

awk -F '~' '{print $NF}' quotes.txt | sort | uniq -c | sort -nr > quotes_byperson.txt	

awk '{for (i=1;i<=NF;i++) if ($i ~ /^s[^a]/) print $i}' quotes.txt > s_words.txt
