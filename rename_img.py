import os, fnmatch
count = 0
array = []
dir_folder =""
#vid_type = 1 #avi
#vid_name = sys.argv[1]
cmd=""
data_config = open('config.txt',"r")
for line in data_config:
    dir_folder = line.rstrip()
    for path, dirs, files in os.walk(os.path.abspath(dir_folder)):
        count = 0
        for filename in fnmatch.filter(files, "*.jpg"):
            old_name = filename
            count=count+1
            if count < 10:
                new_name = "00"+str(count)+".jpg"
            elif count <100:
                new_name = "0"+str(count)+".jpg"
            else:
                new_name = str(count)+".jpg"
            if old_name != new_name:
                os.rename(dir_folder+"\\"+old_name,dir_folder+"\\"+new_name)
    # cmd = "C:\\Users\\dungdt5\\Desktop\\truyen\\run_vr1.bat " + '"{}"'.format(dir_folder) + " " + str(vid_type)
    #cmd = "gen_vid.bat " + '"{}"'.format(dir_folder) + " " + str(vid_type) + " " + str(vid_name)
    #os.system(cmd)