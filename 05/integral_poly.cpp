#include <iostream>
using namespace std;

int main() {
    int A[4] = { 1, 2, 3, 4 };
    int sizeA = sizeof(A)/sizeof(int);
    int sizeB = sizeA - 1;
    int B[sizeB];

    for(int i = 0; i < sizeA; i++) {
        B[i+1] = A[i]/(i+1);
    }

    for(int i = 0; i < sizeB; i++) {
        cout << B[i] << endl;
    }

    return 0;
}
