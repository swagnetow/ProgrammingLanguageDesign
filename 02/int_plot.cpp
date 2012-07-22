#include <iostream>
#include <vector>
using namespace std;

void print(vector<int> number) {
    vector<string> zero, one, two, three, four, five, six, seven, eight, nine, output;

    // Hard code each ASCII 7x7 number into 9 separate vectors.
    zero.push_back(" @@@@@ ");
    zero.push_back("@@   @@");
    zero.push_back("@@   @@");
    zero.push_back("@@   @@");
    zero.push_back("@@   @@");
    zero.push_back("@@   @@");
    zero.push_back(" @@@@@ ");

    one.push_back("   @@  ");
    one.push_back("  @@@  ");
    one.push_back("   @@  ");
    one.push_back("   @@  ");
    one.push_back("   @@  ");
    one.push_back("   @@  ");
    one.push_back(" @@@@@@");

    two.push_back(" @@@@@ ");
    two.push_back("@@   @@");
    two.push_back("    @@ ");
    two.push_back("   @@  ");
    two.push_back("  @@   ");
    two.push_back(" @@    ");
    two.push_back("@@@@@@@");

    three.push_back("@@@@@@@");
    three.push_back("     @@");
    three.push_back("     @@");
    three.push_back("  @@@@@");
    three.push_back("     @@");
    three.push_back("     @@");
    three.push_back("@@@@@@@");

    four.push_back("@@   @@");
    four.push_back("@@   @@");
    four.push_back("@@   @@");
    four.push_back("@@@@@@@");
    four.push_back("     @@");
    four.push_back("     @@");
    four.push_back("     @@");

    five.push_back("@@@@@@@");
    five.push_back("@@     ");
    five.push_back("@@     ");
    five.push_back("@@@@@@@");
    five.push_back("     @@");
    five.push_back("     @@");
    five.push_back("@@@@@@@");

    six.push_back("@@@@@@@");
    six.push_back("@@     ");
    six.push_back("@@     ");
    six.push_back("@@@@@@@");
    six.push_back("@@   @@");
    six.push_back("@@   @@");
    six.push_back("@@@@@@@");

    seven.push_back("@@@@@@@");
    seven.push_back("@@   @@");
    seven.push_back("     @@");
    seven.push_back("     @@");
    seven.push_back("     @@");
    seven.push_back("     @@");
    seven.push_back("     @@");

    eight.push_back("@@@@@@@");
    eight.push_back("@@   @@");
    eight.push_back("@@   @@");
    eight.push_back("@@@@@@@");
    eight.push_back("@@   @@");
    eight.push_back("@@   @@");
    eight.push_back("@@@@@@@");

    nine.push_back("@@@@@@@");
    nine.push_back("@@   @@");
    nine.push_back("@@   @@");
    nine.push_back("@@@@@@@");
    nine.push_back("     @@");
    nine.push_back("     @@");
    nine.push_back("@@@@@@@");

    // Go through each row of the 7x7 number.
    for(int i = 0; i < 7; i++) {
        // Go through each digit that was individually stored to print out the numbers.
        // When the number from the vector matches a given row, print out the row.
        for(int j = number.size()-1; j >= 0; j--) {
            switch(number[j]) {
                case 0:
                    cout << zero[i] << " ";
                    break;
                case 1:
                    cout << one[i] << " ";
                    break;
                case 2:
                    cout << two[i] << " ";
                    break;
                case 3:
                    cout << three[i] << " ";
                    break;
                case 4:
                    cout << four[i] << " ";
                    break;
                case 5:
                    cout << five[i] << " ";
                    break;
                case 6:
                    cout << six[i] << " ";
                    break;
                case 7:
                    cout << seven[i] << " ";
                    break;
                case 8:
                    cout << eight[i] << " ";
                    break;
                case 9:
                    cout << nine[i] << " ";
                    break;
                default:
                    cout << "Error!";
                    break;
            }
        }

        cout << endl;
    }
}

// This function takes a given integer input and splits the number up
// into separate digits. It then passes a vector to a function called
// print() to print out the given integer as in 7x7 ASCII art.
void big_int(int number) {
    vector<int> digits;

    // Goes through the user input and splits the given integer
    // into separate digits.
    while(number != 0) {
        int digit = number % 10;

        digits.push_back(digit);
        number = number / 10;
    }

    if(!digits.empty() && number > 0)
        print(digits);
    else
        cout << "You did not enter a positive integer!" << endl;
}

int main() {
    int number;

    cout << "Enter a number: ";
    cin >> number;

    big_int(number);

    return 0;
}
