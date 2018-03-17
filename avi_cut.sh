#!/bin/bash
printf "
\nadm = Avidemux()
\nadm.loadVideo(\"./$3\")
\nadm.markerA = $1000000
\nadm.markerB = $2000000
\nadm.videoCodec(\"copy\")
\nadm.audioClearTracks()
\nadm.audioAddTrack(0)
\nadm.audioCodec(0, \"copy\")
\nadm.audioSetDrc(0, 0)
\nadm.audioSetShift(0, 0, 0)
\nadm.setContainer(\"MP4V2\", \"optimize=0\", \"add_itunes_metadata=0\")
" > /tmp/avidemux_script.py

avidemux3_cli --run /tmp/avidemux_script.py --save $4
