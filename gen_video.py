import os, fnmatch
count = 0
array = []
dir_folder =""
type_video = 1
cmd=""
data_config = open('config.txt',"r")
for line in data_config:
    dir_folder = line.rstrip()
    for path, dirs, files in os.walk(os.path.abspath(dir_folder)):
        count = 0
        for filename in fnmatch.filter(files, "*.jpg"):
            count=count+1
            if count < 10:
                new_name = "0"+str(count)
            else:
                new_name = str(count)
            os.rename(dir_folder+"\\"+filename,dir_folder+"\\"+new_name+".jpg")
    cmd = "C:\\Users\\dungdt5\\Desktop\\truyen\\run_vr1.bat " + '"{}"'.format(dir_folder) + " " + str(type_video)
    os.system(cmd)