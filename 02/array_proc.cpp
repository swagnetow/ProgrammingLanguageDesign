#include <iostream>
#include <vector>
using namespace std;

// This function reduces a given array by eliminating from it
// all values taht are equal to the three largest and unique
// integers from a given array.
void reduce(int unreduced[], int size) {
    int min = 0, mid = 0, max = 0;
    vector<int> reduced;

    // Goes through a given array and looks for the three
    // largest and unique integers.
    for(int i = 0; i < size; i++) {
       if(unreduced[i] > max)
           max = unreduced[i];
       else if(unreduced[i] < max && unreduced[i] > mid)
           mid = unreduced[i];
       else if(unreduced[i] < mid && unreduced[i] > min)
           min = unreduced[i];
    }

    cout << "unreduced = ";

    // Displays the unreduced array.
    for(int y = 0; y < size; y++)
        cout << unreduced[y] << " ";

    cout << endl;

    // Inserts the numbers that are not max, mid, and min into a new reduced value vector.
    for(int j = 0; j < size; j++)
        if(unreduced[j] != max && unreduced[j] != mid && unreduced[j] != min)
            reduced.push_back(unreduced[j]);

    cout << "reduced = ";

    // Displayed the fixed vector.
    for(int k = 0; k < reduced.size(); k++)
        cout << reduced[k] << " ";

    cout << endl;
}

int main() {
    int a[] = { 9, 1, 1, 6, 7, 1, 2, 3, 3, 5, 6, 6, 6, 6, 7, 9 };
    int n = 16;

    reduce(a, n);

    return 0;
}
