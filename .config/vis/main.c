#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
	int val;
	struct Node *next;
} Node;

int main(void) {
	Node *n = (Node*)malloc(sizeof(Node));
	return 0;
}
