int main(int argc, char *argv[])
{
	int i=0;
    printf ("argc��ֵΪ%d %s\n", argc,*(argv+1));
	for (i=0;i<argc; ++i)
		printf ("argv[%d]��ֵΪ%s\n",i,argv[i]);
    return 0;
}
