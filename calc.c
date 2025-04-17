#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char* calc_str = "%ld %c %ld = %ld\n";

int main (int argc, char* argv[]) {
	if (argc != 4) {
		printf("Usage:\n  %s N [OP] H, where N & H > 0 & OP is an operation.\n", argv[0]);
		return -1;
	} else {
		int a = atol(argv[1]);
		int b = atol(argv[3]);
		int calc;

		if (strcmp(argv[2], "*")==0) {
			calc = a * b;
			printf(calc_str, a, '*', b, calc);
		} else if (strcmp(argv[2], "/")==0) {
			calc = a / b;
			printf(calc_str, a, '/', b, calc);
		} else if (strcmp(argv[2],"+")==0) {
			calc = a + b;
			printf(calc_str, a, '+', b, calc);
		} else if (strcmp(argv[2],"-")==0) {
			calc = a - b;
			printf(calc_str, a, '-', b, calc);
		} else if (strcmp(argv[2],"%")==0) {
			printf("Usage:\n  %s N [OP] H, where N & H > 0 & OP is an operation.\n", argv[0]);
			return -1;
		}
	}
	return 0;
}
