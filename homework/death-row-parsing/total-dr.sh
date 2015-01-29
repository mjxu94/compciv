
bash tx-dr.sh|sed 's/White/TX,White/'| sed 's/Black/TX,Black/'| sed 's/Other/TX,Other/'| sed 's/Hispanic/TX,Hispanic/'| sed 's/Native    American/TX,Native American/'

bash fl-dr.sh|sed 's/WM/FL,White/'|sed 's/WF/FL,White/'|sed 's/BM/FL,Black/'|sed 's/BF/FL,Black/'|sed 's/HM/Fl,Hispanic/'|sed 's/HF/Fl,Hispanic/'|sed 's/OM/Fl,Other/'|sed 's/OF/Fl,Other/'

bash ca-dr.sh|sed 's/WHI/CA,White/'|sed 's/BLA/CA,Black/'|sed 's/HIS/CA,Hispanic/'|sed 's/OTH/CA,Other/'
