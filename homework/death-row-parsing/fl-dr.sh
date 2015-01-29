cat data-hold/florida-roster | pup 'td:nth-of-type(3) text{}' |grep -vP '\xc2\xa0'

cat data-hold/florida-listpresent | pup 'td:nth-of-type(3) text{}' | grep -vP '\xc2\xa0'

cat data-hold/florida-list2 | pup 'td:nth-of-type(3) text{}' | grep -vP '\xc2\xa0'
