import csv
 
f = open('sangpum_encoding.csv', 'r', encoding='ansi')
rdr = csv.reader(f)
for line in rdr:
    print(line[2])
f.close()    