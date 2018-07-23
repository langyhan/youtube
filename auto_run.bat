@echo on
set /a chapter=2
set /a chapter_finished=2
set dest_dir="D:\manga\TF"
set /a multi_chap= 0
set vid_type="avi"

if %multi_chap% == 1 GOTO :loop
if %multi_chap% == 0 GOTO :one

:one
set /a chapter_start=%chapter%
set /a vid_name="%chapter_start%"
set download_dir="%dest_dir%\%chapter_start%"
mkdir %download_dir%> NUL
python make_config.py link.txt %chapter_start% %chapter_start%
python make_config.py config.txt %download_dir%
call down_img.bat %download_dir%
python rename_img.py
call gen_vid.bat %download_dir% %vid_type% %vid_name%
del %download_dir%\*.jpg
set /a chapter=%chapter%+1
if %chapter_start% LSS %chapter_finished% ( 
    GOTO :one
) else (
    GOTO :exit
)

:loop
set /a chapter_start=%chapter%
set /a chapter_end=%chapter%+2
set /a vid_name="%chapter_start%%chapter_end%"
set download_dir="%dest_dir%\%chapter_start%_%chapter_end%"
mkdir %download_dir%> NUL
python make_config.py link.txt %chapter_start% %chapter_end%
python make_config.py config.txt %download_dir%
call down_img.bat %download_dir%
python rename_img.py
call gen_vid.bat %download_dir% %vid_type% %vid_name%
del %download_dir%\*.jpg
set /a chapter=%chapter%+3
if %chapter_end% LSS %chapter_finished% ( 
    GOTO :loop
) else (
    GOTO :exit
)

:exit
ECHO Run complete