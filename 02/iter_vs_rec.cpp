#include <iostream>
#include <time.h>
using namespace std;

int binSearch_iter(int *sorted, int size, int key) {
    int mid;
    int midValue;
    int first = 0;
    int last = size-1;
    
    while(first <= last) {
        mid = (first + last)/2;
        midValue = sorted[mid];

        if(key == midValue)
            // Return the element number.
            return mid;
        else if(key < midValue)
            // Make the new last element the element before the current midpoint.
            last = mid-1; 
        else
            // Make the new first element the element after the current midpoint.
            first = mid+1;     }

    return -1;
}

int binSearch_rec(int *sorted, int leftID, int rightID, int key)
{
    int mid = (leftID + rightID)/2;
    int midValue = sorted[mid];

    if(leftID <= rightID) {
        if(key == midValue)
            return midValue;
        else if(key < midValue)
            // Make the new rightID the element before the current midpoint and call the function again.
            return binSearch_rec(&sorted[0], leftID, mid-1, key);
        else
            // Make the new leftID the element after the current midpoint and call the function again.
            return binSearch_rec(&sorted[0], mid+1, rightID, key);
    }
    
    return -1;
}

// Returns the difference between the start and stop times in milliseconds.
double ms(clock_t start, clock_t stop) {
    return double(stop-start)*1000/CLOCKS_PER_SEC;
}

int main() {
    const int n = 2000000;
    int a[n];
    int x = 20000;
    int first = 0;
    clock_t start1, start2, end1, end2;

    // Create a sorted integer array where a[i] = i.
    for(int i = 0; i < n; i++) {
        a[i] = i;
    }

    start1 = clock();
    binSearch_iter(&a[0], n, x);
    end1 = clock();
    cout << "Iterative binary search time: " << ms(start1, end1) << " ms" << endl;

    start2 = clock();
    binSearch_rec(&a[0], first, n, x);
    end2 = clock();
    cout << "Recursive binary search time: " << ms(start2, end2) << " ms" << endl;

    return 0;
}
