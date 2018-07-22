@echo on
set /a chapter=58
set /a chapter_finished=59

:loop
set /a chapter_start=%chapter%
set /a chapter_end=%chapter%+2
set /a vid_name="%chapter_start%%chapter_end%"
set download_dir="C:\Users\dungdt5\Desktop\yt\GTO\%chapter_start%_%chapter_end%"
::mkdir %download_dir%> NUL
::python make_config.py link.txt %chapter_start% %chapter_end%
::python make_config.py config.txt %download_dir%
::call down_img.bat %download_dir%
python rename_img.py %vid_name%
::del %download_dir%\*.jpg
set /a chapter=%chapter%+3
if %chapter_end% LSS %chapter_finished% GOTO :loop
ECHO Run complete