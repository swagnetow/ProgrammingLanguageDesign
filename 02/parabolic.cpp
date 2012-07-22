#include <iostream>
#include <iomanip>
using namespace std;

// Using Cramer's rule from Linear Algebra to solve for a, b, and c from
// the equation y = ax^2 + bx + c.
float y(float x1, float x2, float x3, float y1, float y2, float y3, float x) {
    float det_a, det_b, det_c, det_div, y;

    float div[3][3] = {{ x1 * x1, x1, 1.0 },
                       { x2 * x2, x2, 1.0 },
                       { x3 * x3, x3, 1.0 }};

    float a[3][3] = {{ y1, x1, 1.0 },
                     { y2, x2, 1.0 },
                     { y3, x3, 1.0 }};

    float b[3][3] = {{ x1 * x1, y1, 1.0 },
                     { x2 * x2, y2, 1.0 },
                     { x3 * x3, y3, 1.0 }};

    float c[3][3] = {{ x1 * x1, x1, x1},
                     { x2 * x2, x2, x2 },
                     { x3 * x3, x3, x3 }};

    // Determinant calculation for matrix divisor.
    det_div = (div[1][1] * div[2][2] - div[1][2] * div[2][1]) * div[0][0];
    det_div -= (div[0][1] * div[2][2] - div[2][1] * div[0][1]) * div[1][0];
    det_div += (div[0][1] * div[1][2] - div[1][1] * div[0][2]) * div[2][0];

    // Determinant calculation for matrix a.
    det_a = (a[1][1] * a[2][2] - a[1][2] * a[2][1]) * a[0][0];
    det_a -= (a[0][1] * a[2][2] - a[2][1] * a[0][1]) * a[1][0];
    det_a += (a[0][1] * a[1][2] - a[1][1] * a[0][2]) * a[2][0];
    det_a /= det_div;

    // Determinant calculation for matrix b.
    det_b = (b[1][1] * b[2][2] - b[1][2] * b[2][1]) * b[0][0];
    det_b -= (b[0][1] * b[2][2] - b[2][1] * b[0][1]) * b[1][0];
    det_b += (b[0][1] * b[1][2] - b[1][1] * b[0][2]) * b[2][0];
    det_b /= det_div;

    // Determinant calculation for matrix c.
    det_c = (c[1][1] * c[2][2] - c[1][2] * c[2][1]) * c[0][0];
    det_c -= (c[0][1] * c[2][2] - c[2][1] * c[0][1]) * c[1][0];
    det_c += (c[0][1] * c[1][2] - c[1][1] * c[0][2]) * c[2][0];
    det_c /= det_div;

    // Equation for a parabola is y = ax^2 + bx + c.
    return (det_a * x * x) + (det_b * x) + det_c;
}

int main() {
    float x1 = 1.0, y1 = 1.0;
    float x2 = 2.0, y2 = 4.0;
    float x3 = 3.0, y3 = 9.0;
    float n = 40.0;
    int counter = 1;

    // The shape of the parabola is x^2.
    for(float x = (x1+((x3-x1))/n); x <= x3; x += (x3-x1)/n)
        cout << "Point #" << counter++ << ": (" << setprecision(3) << x << ", " << setprecision(3) << y(x1, x2, x3, y1, y2, y3, x) << ")" << endl;

    return 0;
}
