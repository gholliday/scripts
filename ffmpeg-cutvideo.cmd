:: Use this for a simple & fast way to trim a .MP4 video file, without any re-encoding
::
:: You'll need ffmpeg.exe in the current directory from https://ffmpeg.zeranoe.com/builds/
::
:: Example: Cut filename.mp4 starting at "5 minutes from the start" and for a duration of "1 hour and 45 minutes"
::    ffmpeg-cutvideo.cmd filename.mp4 00:05:00 01:45:00
::
"%~dp0ffmpeg.exe" -i %1 -acodec copy -vcodec copy -ss %2 -t %3 "%~n1_cut.mp4"
