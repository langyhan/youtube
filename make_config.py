import os, fnmatch, sys
if sys.argv[1] == "link.txt":
    open('link.txt', 'w').close()
    message = r"https://sakuramanga.net/truyen-tranh-tieng-nhat-japanese-manga/fairy-tail-tieng-nhat/fairy-tail-japanese-chap-"
    message = str(sys.argv[4])
    min = int(sys.argv[2])
    max = int(sys.argv[3])
    with open("link.txt", "a") as myfile:
        for i in range(min,max+1):
            myfile.write(message + "0" +str(i) + "/\n")
elif sys.argv[1] == "config.txt":
    open('config.txt', 'w').close()
    message = str(sys.argv[2])
    with open("config.txt", "a") as myfile:
        myfile.write(message + "\n")