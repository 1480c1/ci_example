#include <float.h>
#include <math.h>
#include <stdio.h>
#ifndef M_PI
#define M_PI 3.141592653589793
#endif
#ifndef GIT_HASH
#define GIT_HASH "Unknown"
#endif

int main() {
    printf(
        "Hello World on git hash: %s\n"
        "Pi:       %.*f\n"
        "Expected: 3.14159265358979323846\n",
        GIT_HASH, DECIMAL_DIG, (double)M_PI);
}
