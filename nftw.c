int printName(const char *name, const struct stat *stb, int flag, struct FTW *s)
{
        printf("name %s\n", name);
        return 0;
}

int main(int argc, char **argv)
{
        nftw("/Users/deeplove/Desktop", printName, 1, 0);

        return 0;
}

