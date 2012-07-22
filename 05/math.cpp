#include <iostream>
using namespace std;

void addPoly(int A[], int B[], int sizeA, int sizeB) {
    int length = 0;

    if(sizeA > sizeB) {
        length = sizeA;
    }
    else if(sizeB > sizeA) {
        length = sizeB;
    }
    else {
        length = sizeA;
    }

    int C[length];

    for(int i = 0; i < length; i++) {    
        C[i] = A[i] + B[i];
    }

    for(int i = length - 1; i >= 0; i--) {
        cout << C[i] << " ";
    }

    cout << endl;
}

void mulPoly(int A[], int B[], int sizeA, int sizeB) {
    int sizeC = sizeA + sizeB - 1;
    int C[sizeC];
    int lengthC = sizeof(C)/sizeof(int);

    for(int k = 0; k < sizeC; k++) {
        C[k] = 0;
    }

    for(int i = 0; i < sizeA; i++) {
        for(int j = 0; j < sizeB; j++) {
            C[i+j] += A[i] * B[j];
        }
    }

    for(int i = sizeC -1; i >= 0; i--) {
        cout << C[i] << " ";
    }
    
    cout << endl;
}

void diffPoly(int A[], int sizeA) {
    int sizeB = sizeA - 1;
    int B[sizeB];

    for(int i = 1; i < sizeA; i++) {
        B[i-1] = A[i] * i;
    }

    for(int i = sizeB - 1; i >= 0; i--) {
        cout << B[i] << " ";
    }

    cout << endl;
}

void intPoly(int A[], int sizeA) {
    int sizeB = sizeA - 1;
    int B[sizeB];

    for(int i = 0; i < sizeA; i++) {
        B[i+1] = A[i]/(i+1);
    }

    for(int i = sizeB - 1; i >= 0; i--) {
        cout << B[i] << " ";
    }
    
    cout << endl;
}

int main() {
    int A[] = { 1, 2, 3 };
    int B[] = { 4, 5, 6 };
    int sizeA = sizeof(A)/sizeof(int);
    int sizeB = sizeof(B)/sizeof(int);

    addPoly(A, B, sizeA, sizeB);
    mulPoly(A, B, sizeA, sizeB);
    diffPoly(A, sizeA);
    intPoly(A, sizeA);

    return 0;
}
