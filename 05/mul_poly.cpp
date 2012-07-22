#include <iostream>
using namespace std;

int main() {
    int A[] = { 1, 3 };
    int B[] = { 4, 5 };
    int sizeA = sizeof(A)/sizeof(int);
    int sizeB = sizeof(B)/sizeof(int);
    int sizeC = sizeA + sizeB - 1;
    int C[sizeC];

    for(int k = 0; k < sizeC; k++) {
        C[k] = 0;
    }

    for(int i = 0; i < sizeA; i++) {
        for(int j = 0; j < sizeB; j++) {
            C[i+j] += A[i] * B[j];
        }
    }

    for(int i = 0; i < sizeC; i++) {
        cout << C[i] << " ";
    }

    cout << endl;

    return 0;
}
