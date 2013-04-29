CC=/home1/02341/ajsbu/cilk/bin/cilk++
CFLAGS=-O3

all: 
	$(CC) $(CFLAGS) -o SequentialBFS SequentialBFS.cilk
	$(CC) $(CFLAGS) -o ParallelBFS ParallelBFS.cilk
	$(CC) $(CFLAGS) -o ParallelBFS_DeltaFree ParallelBFS_DeltaFree.cilk
	$(CC) $(CFLAGS) -o ParallelBFS_CilkView ParallelBFS_CilkView.cilk -lcilkutil
	$(CC) $(CFLAGS) -o ParallelBFS_DeltaFree_CilkView ParallelBFS_DeltaFree_CilkView.cilk -lcilkutil

clean:
	rm -rf ParallelBFS output_ParallelBFS error_ParallelBFS core*
