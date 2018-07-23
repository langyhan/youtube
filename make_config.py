import os, fnmatch
import sys
if sys.argv[1] == "link.txt":
    open('link.txt', 'w').close()
    message = r"https://sakuramanga.net/truyen-tranh-tieng-nhat-japanese-manga/fairy-tail-tieng-nhat/fairy-tail-japanese-chap-"
    min = int(sys.argv[2])
    max = int(sys.argv[3])
    with open("link.txt", "a") as myfile:
        for i in range(min,max+1):
            #myfile.write(r"C:\Users\dungdt5\Desktop\truyen\shokugeki\Shokugeki no Soma " + str(i) + "\n")
            myfile.write(message + "00" +str(i) + "/\n")
elif sys.argv[1] == "config.txt":
    open('config.txt', 'w').close()
    message = str(sys.argv[2])
    with open("config.txt", "a") as myfile:
        myfile.write(message + "\n")