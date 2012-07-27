int main(int argc, char *argv[])
{
	int i=0;
    printf ("argc的值为%d %s\n", argc,*(argv+1));
	for (i=0;i<argc; ++i)
		printf ("argv[%d]的值为%s\n",i,argv[i]);
    return 0;
}
