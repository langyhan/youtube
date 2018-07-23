import shutil, sys
src = sys.argv[1]
dest = sys.argv[2]
shutil.copy(src, dest)