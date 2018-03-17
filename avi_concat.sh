#!/bin/bash
printf "
adm = Avidemux()
adm.loadVideo(\"$1\")
" > /tmp/avidemux_script.py

svar=0
for var in "${@:2}"
do
	svar=$(($svar + 1))
	if [ $svar -eq $(($# - 1)) ]; then
		break	
	fi
	printf "adm.appendVideo(\"$var\")\n" >> /tmp/avidemux_script.py
done

printf "
adm.videoCodec(\"copy\")
adm.audioClearTracks()
adm.audioAddTrack(0)
adm.audioCodec(0, \"copy\")
adm.audioSetDrc(0, 0)
adm.audioSetShift(0, 0, 0)
adm.setContainer(\"MP4V2\", \"optimize=0\", \"add_itunes_metadata=0\")
" >> /tmp/avidemux_script.py

avidemux3_cli --run /tmp/avidemux_script.py --save ${@:$#}
~
