mkdir data-hold

cd  data-hold

echo '1.'
curl http://www.tdcj.state.tx.us/death_row/dr_offenders_on_dr.html > texas-offenders

echo '2.'
curl http://www.tdcj.state.tx.us/death_row/dr_list_all_dr_1923-1973.html > texas-list

echo '3.'
curl http://www.dc.state.fl.us/activeinmates/deathrowroster.asp > florida-roster

echo '4.'
curl http://www.dc.state.fl.us/oth/deathrow/execlist.html > florida-listpresent

echo '5.'
curl http://www.dc.state.fl.us/oth/deathrow/execlist2.html > florida-list2

echo '6.'
curl http://www.cdcr.ca.gov/capital_punishment/docs/condemnedinmatelistsecure.pdf > california.pdf
pdftotext california.pdf
rm -f california.pdf

cd ..
