CC=/home1/02341/ajsbu/cilk/bin/cilk++

#CC=/home1/02341/ajsbu/cilk-5.4.6/support/cilkc

CFLAGS=-O3


all:
	$(CC) $(CFLAGS) -o ParallelCC2 ParallelCC2.cilk
	$(CC) $(CFLAGS) -o ParallelBFS ParallelBFS.cilk
	$(CC) $(CFLAGS) -o ParallelCC2_Cilkview ParallelCC2_Cilkview.cilk -lcilkutil

clean:
	rm -rf SerialTSP
