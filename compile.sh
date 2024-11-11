clear

OUT_FILE="out/main"
DEFINES=(-DSIMULATOR -DSINGLE_THREADED -DHACK_ALERT -DFULL_LANGUAGE_SUPPORT -DFULL_LTS -DNO_INDEXES -DDIRECT_LTS_INPUT -DACNA -DHOMOGRAPHS -DMATH_MODE -DDIVIDED_LTS_RULES -DOUTPUT_FILE)
CFLAGS=(-Wl,-Bstatic -Wl,-Bdynamic -I include -w -g)

gcc ${DEFINES[@]} ${CFLAGS[@]} main.c src/*.c -o $OUT_FILE

cd out

./main

#convert output to usable wav
sox -t raw -r 8k -e signed -b 16 -c 1 output.pcm output.wav
rm output.pcm

cd ..
