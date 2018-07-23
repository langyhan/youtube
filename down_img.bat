@echo off
set download_img_dir=%1
for /f "delims=" %%L in (link.txt) do set link=%%L&call :process
goto :exit
:process
    image-scraper -s %download_img_dir% %link% --formats jpg
:exit