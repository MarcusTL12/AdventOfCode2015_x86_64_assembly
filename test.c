#include <sys/stat.h>

long long file_size(char *filename)
{
    struct stat st;
    stat(filename, &st);
    return st.st_size;
}

long long testfunc()
{
    struct stat st;
    return sizeof(st);
}
