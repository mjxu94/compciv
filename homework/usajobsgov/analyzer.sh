if [[ "$#" -eq 1 ]]; then
  cd data-hold/scrapes/$1
  yearlyjobs=$(cat *.json | jq '.JobData[] | select(.SalaryBasis == "Per Year")')
  jobinfo=$(echo $yearlyjobs | jq '. | {JobTitle, SalaryMin, SalaryMax}')
  while read line; do
    title=$(echo $line | grep -oE '[[:alpha:]].+')
    rows=$(echo $jobinfo | jq "select(.JobTitle == \"$title\")" )
    min=$(echo $rows | jq -r '.SalaryMin' | tr -d '$' | tr -d ',' | sort -n | head -n 1)
    max=$(echo $rows | jq -r '.SalaryMax' | tr -d '$' | tr -d ',' | sort -rn | head -n 1)
    echo "$title | $min | $max"
  done < <(echo $yearlyjobs | jq -r '.JobTitle' | sort | uniq -c | sort -rn |head -n 25)
else
  echo "Please pass in only one argument in the format of 'YYYY-MM-DD-HHHH'."
fi
