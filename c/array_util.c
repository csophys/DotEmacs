#include "array_util.h"
int main(int argc, char *argv[]){
	int i;
	printf ("数组a:请输入10个整数\n");
	for ( i = 0; i < MAX_LENGTH; ++i){
		scanf("%d",a+i);
	}
	printf ("数组b:请输入10个整数\n");
	for ( i = 0; i < MAX_LENGTH; ++i){
		scanf("%d",b+i);
	}
	bubble_sort(a);
	bubble_sort(b);
	array_merge(a,b);
	print_sort(c);
	return 0;
}

void bubble_sort(int a[]){
	int i,j;
	for(i=0;i<MAX_LENGTH;i++)
		for(j=0;j<MAX_LENGTH-i-1;j++){
			if(a[j]>a[j+1]) swap(a+j,a+j+1);
		}
}

void swap(int *a,int *b){
	int temp;
	temp=*a;
	*a=*b;
	*b=temp;
}


void print_sort(int a[]){
	int i;
	printf ("c的大小为：%d\n",sizeof(a));

	for ( i = 0; i <20; ++i)
		printf ("%d\n",*(a+i));
	printf ("print end!\n");

}

void array_merge(int a[],int b[]){
	int ai,bi,ci;
	for(ai=0,bi=0,ci=0;ai<MAX_LENGTH&&bi<MAX_LENGTH;ci++){
		if(a[ai]<=b[bi]){
			c[ci]=a[ai++];
		}
		else{
			c[ci]=b[bi++];
		} 
	}
	while(ai<MAX_LENGTH)
		c[ci++]=a[ai++];
	while(bi<MAX_LENGTH)
		c[ci++]=b[bi++];
}
