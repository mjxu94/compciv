cat data-hold/* | pup "p text{}" > wh-words.txt
cat data-hold/* | pup "div.legacy-para text{}" >> wh-words.txt
cat wh-words.txt | tr '[:upper:]' '[:lower:]' | grep -oiE "[[:alpha:]]{7,}" | sort | uniq -c | sort -r | head -n 10
