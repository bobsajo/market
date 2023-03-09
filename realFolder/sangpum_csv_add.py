import csv
 
f1 = open('.\_realFolder\sangpum_encoding.csv', 'r', encoding='ansi')
f2 = open('.\_realFolder\sangpum2_encoding.csv', 'r', encoding='ansi')
f3 = open('.\_realFolder\sangpum3_encoding.csv', 'r', encoding='ansi')
f4 = open('.\_realFolder\sangpum4_encoding.csv', 'r', encoding='ansi')

rdr = csv.reader(f1)
for line in rdr:
    print(line[2])


#item_list = pd.DataFrame(data=info_list,columns=['item_name','price','item_img','sub_title','info_img',
#'seller','package_type','package_detail','sell_unit','weight','origin','allergy','warning','item_detail','category'])
#item_list.to_csv('C:\sist1226\getMaket\_realFolder\sangpum_total.csv')

f.close()   