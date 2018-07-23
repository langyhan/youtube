@echo off
set dir_manga=%1
set vid_type=%2
set vid_name=%3
IF %vid_type% EQU "avi" (
::ghep anh thanh video
	ffmpeg -framerate 0.2 -i %dir_manga%/%%03d.jpg %dir_manga%/video_raw.avi
::Add music vao video
	ffmpeg -y -i music.mp3 -i %dir_manga%/video_raw.avi -codec copy -shortest -preset superfast %dir_manga%/video_music.avi
::chen logo
	ffmpeg -i %dir_manga%/video_music.avi -i logo_small.png -filter_complex "overlay=0:0" %dir_manga%/%vid_name%.avi	
) ELSE (
::ghep anh thanh video
	ffmpeg -framerate 0.2 -i %dir_manga%/%%03d.jpg -vf format=yuv420p %dir_manga%/video_raw.mp4
::Add music vao video
	ffmpeg -y -i music.mp3 -i %dir_manga%/video_raw.mp4 -codec copy -shortest -preset superfast %dir_manga%/video_music.mp4
::chen logo	
	ffmpeg -i %dir_manga%/video_music.mp4 -i logo.png -filter_complex "overlay=0:0" %dir_manga%/%vid_name%.mp4
)
del %dir_manga%\video_raw.avi
del %dir_manga%\video_raw.mp4
del %dir_manga%\video_music.avi
del %dir_manga%\video_music.mp4

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:://ghep anh thanh video//
::ffmpeg -framerate 0.2 -start_number 01 -i %02d.jpg video_raw.avi
::ffmpeg -framerate 0.2 -start_number 01 -i %02d.jpg -vf format=yuv420p video_raw.mp4

:://Ghep 2 file mp3//
:://ffmpeg -i music1.mp3 -i music2.mp3 -filter_complex amix=inputs=2:duration=longest:dropout_transition=3 music.mp3

:://Add music vao video//
::ffmpeg -y -i music.mp3 -i video_raw.avi -codec copy -shortest -preset superfast video_music.avi
::ffmpeg -y -i music.mp3 -i video_raw.mp4 -codec copy -shortest -preset superfast video_music.mp4
::
:://Convert to avi//
:://ffmpeg -y -i outro.mp4 -vcodec libx264 -pix_fmt yuv420p -r 30 -g 60 -b:v 1400k -profile:v main -level 3.1 -acodec libmp3lame -b:a 128k -ar 44100 -f avi -preset superfast outro.avi
::
:://Gh�p main - outro
::
:://chen logo
::ffmpeg -i video_music.avi -i logo_small.png -filter_complex "overlay=0:0" video_music_logo.avi
::ffmpeg -i video_music.mp4 -i logo.png -filter_complex "overlay=0:0" video_music_logo.mp4