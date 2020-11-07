#include <stdbool.h>
#include <string.h>


bool test_cmp(void *a, void *b, void *udata) {
    if (*((long long *) a) != *((long long *) a)) {
        return false;
    } else {
        return memcmp(a + 8, b + 8, *((long long *) a));
    }
}
