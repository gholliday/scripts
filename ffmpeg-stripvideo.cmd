:: Use this if you have a video file, and you want to extract the audio from it as .MP3
::
:: I find this handy for listening to recordings of conference presentations when I'm
:: unable to watch a screen.
::
:: You'll need ffmpeg.exe in the current directory from https://ffmpeg.zeranoe.com/builds/
::
"%~dp0ffmpeg" -i %1 -vn -ab 128k "%~n1.mp3"