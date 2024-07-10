@echo off
chcp 1251 >NUL
chcp 866 >NUL
set /p "id=Enter text: "
tts  --language_idx ru --text "%id%" --out_path VideoRetalking\1--1.wav --speaker_wav input\src-audio\1.wav --model_name tts_models/multilingual/multi-dataset/xtts_v2 
copy "input\src-img\1.jpg" "LivePortrait"
copy "input\src-video\1.mp4" "LivePortrait"
cd LivePortrait
call StartLP.cmd
cd ..
copy "1--1.mp4" "VideoRetalking"
del 1--1.mp4
del 1--1_concat.mp4
del 1--1_concat_no_audio.mp4
cd VideoRetalking
call StartVR
pause
