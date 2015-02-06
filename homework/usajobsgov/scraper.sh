timestamp=$(date '+%Y-%m-%d_%H00')
mkdir data-hold/scrapes/$timestamp
jobcategories=$(cat data-hold/OccupationalSeries.xml | hxselect -c -s '\n' CodeList#OccupationSeriesFamily JobFamily)
for jobfamily in $jobcategories; do
  curl -s -o ./data-hold/scrapes/$timestamp/$jobfamily-1.json https://data.usajobs.gov/api/jobs?series=$jobfamily'&'NumberOfJobs=250
  page_count=1
  max=$(cat data-hold/scrapes/$timestamp/$jobfamily-1.json | jq -r '.Pages')
  echo "Fetching jobs in $jobfamily, page $page_count"

  if [[ $max -gt 1 ]]; then
    for page_count in $(seq 2 $max); do
      curl -s -o ./data-hold/scrapes/$timestamp/$jobfamily-$page_count.json https://data.usajobs.gov/api/jobs?series=$jobfamily'&'NumberOfJobs=250'&'Page=$page_count
      echo "Fetching jobs in $jobfamily, page $page_count"
    done
  fi
done
