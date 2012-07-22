#include <iostream>
using namespace std;

// Returns the length of the longest sequence of identical numbers in a given array.
// The solution has the time complexity of O(n).
int maxlen(int array[], int size) {
    int temp = 0;
    int counter = 1;
    int max = 1;

    for(int i = 0; i < size; i++) {
        int current = array[i];

        // If the current number is the same as the last number,
        // increment the counter.
        if(current == temp) {
            counter++;
        }

        // When the current number in the array is greater than the last number,
        // check if the current longest sequence is bigger than the last longest 
        // sequence. After the check, set the counter back to 1 and set the 
        // temporary number to the current number.
        if(current > temp) {
            if(counter > max) {
                max = counter;
            }

            counter = 1;
            temp = current;
        }
    }

    return max;
}

int main() {
    int a[] = { 1, 1, 1, 2, 3, 5, 6, 6, 6, 6, 7, 9 };
    int n = sizeof(a);

    cout << "The longest sequence in the array was: " << maxlen(a, n) << endl;

    return 0;
}
