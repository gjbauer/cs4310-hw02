
#include <stdio.h>
#include <stdlib.h>

int
main(int argc, char* argv[])
{
    long x=1,y=0,z=0,i=0;
    if (argc != 2 || atol(argv[1])<0) {
        printf("Usage:\n  %s N, where N > 0\n", argv[0]);
        return -1;
    }

    while (i<atol(argv[1])) {
        z=y+x;
	x=y;
	y=z;
	i++;
    }

    printf("fib(%ld) = %ld\n", atol(argv[1]), z);
    return z;
}
