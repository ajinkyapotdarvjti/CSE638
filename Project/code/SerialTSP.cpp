#include <iostream>
#include <fstream>
#include <vector>
#include <queue>
#include <cstdlib>
#include <cmath>
#include <sys/time.h>

#include "header/graph.h"

#define BATCH_NUMBER 10000
#define BATCH_SIZE 100
#define PH_EVAPORATION 0.1
#define MAX_INT 1000000

#define MAX_EDGE_COST 20
#define PH_DEFAULT 500

#define A 1
#define B 2
#define K 1

using namespace std;

struct coordinate {
        double x;
        double y;
};

Graph* get_graph(char *file_name) {

        ifstream input_file;
                        
        input_file.open(file_name);
        char x_str[100];
        char y_str[100];
        char coordinate_number[100];
        std::vector<coordinate> vec;
        if (input_file.is_open()) {
                while (input_file >> coordinate_number) {
                        input_file >> x_str;
                        input_file >> y_str;
                        struct coordinate c;
                        c.x = atof(x_str);
                        c.y = atof(y_str);
                        vec.push_back(c);
                        //cout<<"x_str:" <<x_str << ", y_str: " << y_str << ", size = " << vec.size() << endl;
                }
        }

        input_file.close();

        int n = vec.size();

        Graph *g = new Graph(n);;

        for(int i=0; i<n; i++) {
                for(int j=0; j<i; j++) {
                        coordinate c1 = vec.at(i);
                        coordinate c2 = vec.at(j);
                       
                        double dist = sqrt((c2.x- c1.x)*(c2.x - c1.x) + (c2.y - c1.y) * (c2.y - c1.y));
                        g->add_edge(i, j, (long)dist, (long)PH_DEFAULT);
                        g->add_edge(j, i, (long)dist, (long)PH_DEFAULT);
                }
        }
	return g;
}

void display_result(int c, int *d, int n) {
        for(int i=0; i<n; i++) {
                cout << "->" <<  d[i];
        }
        cout << "...cost = " << c << endl;
}

void ant_travel(Graph *g, int r, int *a) {

	//cout << "called ant_travel with r = " << r << endl;
	int k = 0;
	int *visited = new int[g->n];
	for(int i=0; i<g->n; i++) {
		visited[i] = 0;
	}

	a[k++] = r;
	visited[r] = 1;

	while(k<g->n) {

		//cout << "Reached....k = " << k << endl;
		int outdegree = g->vertices[a[k-1]]->neighbors->size();

		int p_length = 0;
                for(int j=0; j<outdegree; j++) {
                        Neighbor* n1 = g->vertices[a[k-1]]->neighbors->at(j);
			if(visited[n1->v->id] == 0) {
				//cout << "n1->ph = " << n1->ph << endl;
				p_length++;
			}
                }

		long **p = new long*[p_length];
		for(int j=0; j<p_length; j++) {
			p[j] = new long[2];
		}

		int p_point = 0;
		for(int j=0; j<outdegree; j++) {
			Neighbor* n1 = g->vertices[a[k-1]]->neighbors->at(j);
			//cout << "iterating over unvisited neighbors....visited[n1->v->id]" << visited[n1->v->id] << endl;
                        if(visited[n1->v->id] == 0) {
				double ph_factor = (double)pow((double)n1->ph, (double)A);
				double edge_factor = (double)pow((double)1/(double)n1->cost, (double)B);
				double b = ph_factor * edge_factor;
				b = b * 10000;
				if(b<1) b = 1;
				//cout << "b = " << b << endl;
			
				p[p_point][0] = n1->v->id;
				p[p_point++][1] = (long)b;

				if(p[p_point-1][1] < 0) {
					//cout << "p[p_point-1][1] = " << p[p_point-1][1] << ", b = " << b << ", n1->ph = " << n1->ph << ", edge factor = " << edge_factor << endl;
				}

			}
		}

		double sum = 0;

		for(int j=0; j<p_length; j++) {
			sum = sum + p[j][1];
		}

		int c = rand() % long(sum);
		c++;
		double s = 0;
		if(sum < 0) {
			//cout << "sum = " << sum << ", long(sum) = " << long(sum) << ", c = " << c << endl;
		}

		// sum may  exceed the data type limit, take care
		for(int j=0; j<p_length; j++) {
			s = s + p[j][1];

			if(s >= c) {
				a[k++] = p[j][0];
				visited[a[k-1]] = 1;
				break;
			}
		}

		for(int j=0; j<p_length; j++) {
			delete []p[j];
		}
		delete []p;

	}

	delete []visited;

}

long get_cost(Graph *g, int *d) {

        long c = 0;

        for(int j=0; j<g->n; j++) {
                int outdegree = g->vertices[d[j]]->neighbors->size();
                for(int k=0; k<outdegree; k++) {
                        Neighbor* n1 = g->vertices[d[j]]->neighbors->at(k);
                        if(n1->v->id == d[(j+1)%g->n]) {
                                c = c + n1->cost;
                        }
                }
        }

        return c;
}

void shift(int a[],int n) {
	int s; 
	s=a[n-1];
	for(int i=n-1;i>0;i--) {
		a[i]=a[i-1];
	}
        a[0]=s;
}

void brute_force(Graph *g, int a[],int m,int n, int *result, int *min_c) {

	for(int i=0;i<m;i++) {

		if(m>1) {
			shift(a,m);
			brute_force(g, a,m-1,n, result, min_c);
   		} else {

                	int c = get_cost(g, a);

     		        if(c < *min_c) {
        	                *min_c = c;

                        for(int j=0; j<n; j++) {
                                result[j] = a[j];
                        }
                }

    		}
   	}
}

long aco_tsp(Graph *g, int *d) {

	long min_c = MAX_INT;

	for(int i=0; i<BATCH_NUMBER; i++) {

		// send one batch of ants
		for(int j=0; j<BATCH_SIZE; j++) {
			int *a = new int[g->n];
			int r = rand() % g->n;
			//cout << "ant no.." << j << ", r = " << r << ", batch no. " << i << endl;
			ant_travel(g, r, a);

			//cout << "ant is back" << endl;

			//update the pheromone levels

			// find the total cost of this path
			long c = get_cost(g, a);

			if(c < min_c) {
				min_c = c;

				for(int j=0; j<g->n; j++) {
					d[j] = a[j];
				}
			}

			c = (long)pow((double)c, (double)K);

			// update the temp ph for the edges of this path
                	for(int j=0; j<g->n; j++) {
                        	int outdegree = g->vertices[a[j]]->neighbors->size();
                        	for(int k=0; k<outdegree; k++) {
                                	Neighbor *n1 = g->vertices[a[j]]->neighbors->at(k);
					if(n1->v->id == a[(j+1)%g->n]) {
						double old_temp_ph =  n1->temp_ph;
						n1->temp_ph = n1->temp_ph + ((double)1/(double)c);
						if(n1->temp_ph > 1) {
							cout << "updating temp ph " << n1->temp_ph << ", old temp ph...." << old_temp_ph << ", c = " << c << endl;
						}
					}
                        	}
                	}

			delete []a;
		}

		// update ph for all the edges
		//cout << "end of batch...." << i << ", cost so far " << min_c << endl;

		for(int j=0; j<g->n; j++) {
			int outdegree = g->vertices[j]->neighbors->size();
			for(int k=0; k<outdegree; k++) {
				Neighbor *n1 = g->vertices[j]->neighbors->at(k);
				long old_ph = n1->ph;
				double d = (1-PH_EVAPORATION)*n1->ph + n1->temp_ph*1000000;
				n1->ph = (long)d;
				//cout << "old ph = " << old_ph << ", n1->temp_h = " << n1->temp_ph << ", new ph = " << n1->ph << endl;
				n1->temp_ph = 0;
			}
		}
	}

	return min_c;
}

long brute_force_tsp(Graph *g, int *d) {


	int *a = new int[g->n];
	for(int i=0;i<g->n;i++)
        	a[i] = i;

	int min_c = MAX_INT;
    	brute_force(g, a, g->n, g->n, d, &min_c);

	delete []a;

	return get_cost(g, d);
}

int cilk_main() {

        char file_name[20];
        cin >> file_name;

        Graph *g = get_graph(file_name);

        int *a = new int[g->n];
        long c = 0;
        struct timeval start, end;
        long mtime, seconds, useconds;
        gettimeofday(&start, NULL);
        // -------------------- measurement begins -------------------------------
        c = aco_tsp(g, a);
        // -------------------- measurement ends -------------------------------
        gettimeofday(&end, NULL);
        seconds  = end.tv_sec  - start.tv_sec;
        useconds = end.tv_usec - start.tv_usec;
        mtime = ((seconds) * 1000 + useconds/1000.0) + 0.5;

        cout << "Serial ACO: Time = " << mtime << endl;
        display_result(c, a, g->n);
        //g.display();

	delete a;
	delete g;

	return 0;
}

