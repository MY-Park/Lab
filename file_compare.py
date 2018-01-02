import datetime

path = '/home/mypark109/PycharmProjects/'
t1_out = open(path+'t1_output.txt','w')
pet_out = open(path+'PET_output.txt','w')

#Inputs are 2 dates in string. Return the absolute difference between 2 dates.
def compare_dates(str1, str2):
    t1 = datetime.datetime.strptime(str1,'%Y%m%d')
    t2 = datetime.datetime.strptime(str2,'%Y%m%d')
    delta = abs((t1-t2).days)
    return delta

def check_files(f1, f2, fo):
    set_1 = set()
    set_2 = set()
    with open(f1, 'r') as f:
        for line in f:
            fname = line.strip()
            if len(fname) == 0:
                continue
            set_1.add(fname)
    with open(f2, 'r') as f:
        for line in f:
            fname = line.strip()
            if len(fname) == 0:
                continue
            set_2.add(fname)
    set_3 = set_1 & set_2

    with open(fo, 'w') as out_list:
        for fname in set_3:
            out_list.write(fname + "\n")


def copy_files(f1,f2):
    with open(f1,'r') as list1:
        with open(f2,'w') as list2:
            for line in list1:
                list2.write(line[1:-2]+'\n')

def delete_file2(f1,f2,temp):
    t1_temp = open(path+temp,'w')
    with open(path+f1,'r') as t1_line:
        for line1 in t1_line:
            with open(path + f2, 'r') as ori_t1_line:
                for line5 in ori_t1_line:
                    if line1 == line5:
                        ori_t1_line.close()
                        break
                else:
                    t1_temp.write(line1)
                    pass
    t1_temp.close()

with open(path+'t1_list.txt','r') as t1_line:
    for line1 in t1_line:
        min_date = 100
        min_str = ""

        with open(path+'temp.txt','w') as pet_temp_out, open(path+'pet_exist_list.txt','r') as pet_line:
            for line2 in pet_line:
                if line1[:15] in line2:
                    if "FDG" in line2:
                        pet_temp_out.write(line2)

        pet_line.close()
        pet_temp_out.close()

        with open(path+'temp.txt','r') as pet_temp_out:
            for line3 in pet_temp_out:
                if line3 == "":
                    continue
                time1 = line1.split("br_raw_",1)[1]
                time1 = time1[:8]

                time2 = line3.split("br_raw_",1)[1]
                time2 = time2[:8]

                d = compare_dates(time1,time2)

                if (d < 90) & (d < min_date):
                    min_date = d
                    min_str = line3
        pet_temp_out.close()

        with open(path+'PET_output.txt','r') as pet_out:
            if min_date == 100:
                pet_out.close()
                continue
            else:
                for line4 in pet_out:
                    if min_str == line4:
                        pet_out.close()
                        break
                else:
                    pet_out.close()
                    pet_out = open(path+'PET_output.txt','a')
                    t1_out.write(line1)
                    pet_out.write(min_str)
                    pet_out.close()


