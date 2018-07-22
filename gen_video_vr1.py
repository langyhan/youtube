import os, fnmatch
from PIL import Image
count = 0
array = []
dir_folder =""
type_video = 2
cmd=""
data_config = open('config.txt',"r")
for line in data_config:
    dir_folder = line.rstrip()
    for path, dirs, files in os.walk(os.path.abspath(dir_folder)):
        count = 0
        for filename in fnmatch.filter(files, "*.jpg"):
            img = Image.open(dir_folder+"\\"+filename)
            width, height = img.size
            up = (0, 0, width, height/2)
            down = (0, height/2, width, height)
            img_up = img.crop(up)
            img_down = img.crop(down)

            if count < 10:
                new_name_up = dir_folder+"\\"+"0"+str(count)+".jpg"
                new_name_down = dir_folder+"\\"+"0"+str(count+1)+".jpg"
            else:
                new_name_up = dir_folder+"\\"+str(count)+".jpg"
                new_name_down = dir_folder+"\\"+str(count+1)+".jpg"
            count = count+2
                   
            #Saved in the same relative location
            img_up.save(new_name_up)
            img_down.save(new_name_down)
            
            #os.rename(dir_folder+"\\"+filename,dir_folder+"\\"+new_name+".jpg")
    cmd = "C:\\Users\\dungdt5\\Desktop\\truyen\\run_vr1.bat " + '"{}"'.format(dir_folder) + " " + str(type_video)
    os.system(cmd)