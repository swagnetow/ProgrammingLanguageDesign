#include <iostream>
using namespace std;

int main() {
    int A[4] = { 1, 2, 3, 12 };
    int B[3] = { 4, 5, 6 };
    int sizeA = sizeof(A)/sizeof(int);
    int sizeB = sizeof(B)/sizeof(int);
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

    for(int i = 0; i < length; i++) {
        cout << C[i] << endl;
    }

    return 0;
}
