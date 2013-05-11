CC=/home1/02341/ajsbu/cilk/bin/cilk++

#CC=/home1/02341/ajsbu/cilk-5.4.6/support/cilkc

CFLAGS=-O3


all:

	$(CC) $(CFLAGS) -o RecMM RecMM.cilk
	$(CC) $(CFLAGS) -o IterMM IterMM.cilk
	$(CC) $(CFLAGS) -o ZMortan ZMortan.cilk
	$(CC) RecMM_PAPI.cilk -o RecMM_PAPI -I${TACC_PAPI_INC} -L${TACC_PAPI_LIB} -lpapi
	$(CC) ZMortan_PAPI.cilk -o ZMortan_PAPI -I${TACC_PAPI_INC} -L${TACC_PAPI_LIB} -lpapi
	$(CC) IterMM_PAPI.cilk -o IterMM_PAPI -I${TACC_PAPI_INC} -L${TACC_PAPI_LIB} -lpapi
	$(CC) ZMortan_PAPI_NoMemLayout.cilk -o ZMortan_PAPI_NoMemLayout -I${TACC_PAPI_INC} -L${TACC_PAPI_LIB} -lpapi

