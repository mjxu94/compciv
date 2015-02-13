username=$1

mkdir -p ./data-hold
echo "Fetching tweets for $username into ./data-hold/$username-timeline.csv"

file=data-hold/$username-timeline.csv

t timeline -n 3200 --csv $username > $file

count=$(csvfix order -f 1 $file | wc -l)

lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)

echo "Analyzing $count tweets by $username since $lastdate"

echo "Top 10 hashtags by $username"
csvfix order -fn 'Text' $file | grep -oiE '#[a-z,0-9,_]+\b'|sort | uniq -c | sort -r | head -n 10

echo "Top 10 retweets by $username"
csvfix order -fn 'Text' $file | grep -oiE 'RT @[a-z,0-9,_]+\b'|sort|uniq -c|sort -rn|head -n 10

echo "Top 10 mentioned users (not including retweets) by $username"
csvfix order -fn 'Text' $file | grep -viE 'RT' | grep -oiE '@[a-z,0-9,_]+\b'|sort|uniq -c|sort -rn|head -n 10

echo "Top tweeted words with 5+ letters by $username"
csvfix order -fn 'Text' $file | grep -oiE "[[:alpha:]]{5,}" | grep -viE $username | grep -viE '@[a-z,0-9,_]' | grep -viE '#[a-z,0-9,_]+\b' | grep -viE 'http.+\b'|sort|uniq -c|sort -rn|head -n 10

