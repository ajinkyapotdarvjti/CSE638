CC=/home1/02341/ajsbu/cilk/bin/cilk++
CFLAGS=-O3


all:
	$(CC) $(CFLAGS) -c src/Graph.cpp

	$(CC) $(CFLAGS) -c SerialTSP.cpp
	$(CC) $(CFLAGS) -o SerialTSP Graph.o SerialTSP.o
	
	$(CC) $(CFLAGS) -c ParallelTSP.cilk
	$(CC) $(CFLAGS) -o ParallelTSP Graph.o ParallelTSP.o

	$(CC) $(CFLAGS) -c ParallelTSP_System.cilk
	$(CC) $(CFLAGS) -o ParallelTSP_System Graph.o ParallelTSP_System.o

	$(CC) $(CFLAGS) -c SCS_TSP.cilk
	$(CC) $(CFLAGS) -o SCS_TSP Graph.o SCS_TSP.o

clean:
	rm -rf SerialTSP
