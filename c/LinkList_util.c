#include "stdio.h"

typedef struct LNode
{
    int data;
	struct LNode *next;
}LNode,*LinkList;

void LinkList_create_head(LinkList a,int data);
void LinkList_create_tail(LinkList a,int data);
void LinkList_sort_Bubble(LinkList a);
void LinkList_print(LinkList a);
void LinkList_free(LinkList a);
void swap(int *a,int *b);

LinkList a,b;

int main(int argc, char *argv[])
{
	int num;
	a=(LinkList)malloc(sizeof(LNode));
	a->next=NULL;
	b=(LinkList)malloc(sizeof(LNode));
	b->next=NULL;
	printf ("����a:������һ����������0��ֹ\n");
	while(scanf("%d",&num)){
		if(num==0) break;
		else {
			LinkList_create_head(a,num);
		}
	}
	printf ("����b:������һ����������0��ֹ\n");
	while(scanf("%d",&num)){
		if(num==0) break;
		else {
			LinkList_create_tail(b,num);
		}
	}
	LinkList_print(a);
	LinkList_print(b);
	LinkList_sort_Bubble(a);
	LinkList_sort_Bubble(b);
	LinkList_print(a);
	LinkList_print(b);
	LinkList_free(a);
	LinkList_free(b);
}

//ͷ���봴������
void LinkList_create_head(LinkList a,int data){
	LinkList Head_a=a;
	LinkList new_node=(LinkList)malloc(sizeof(LNode));
	new_node->data=data;
	new_node->next=Head_a->next;
	Head_a->next=new_node;
}

//β�巨��������
void LinkList_create_tail(LinkList a,int data){
	LinkList tail=a;
	while(tail->next){
		tail=tail->next;
	}
	LinkList new_node=(LinkList)malloc(sizeof(LNode));
	new_node->data=data;
	new_node->next=NULL;
	tail->next=new_node;
}

//��ӡ����
void LinkList_print(LinkList a){
	LinkList Head_a=a;
	while(Head_a->next!=NULL){
		printf ("%d\t",Head_a->next->data);
		Head_a=Head_a->next;
	}
	printf ("\n");
}


//�ͷ�����
void LinkList_free(LinkList a){
	LinkList Head_a=a;
	LinkList p=Head_a->next;
	if(!p) free(Head_a);
	while(p){
		free(Head_a);
		Head_a=p;
		p=p->next;
	}
}

//����ð������,���ǻ���������㡣ÿ�ζ������n������

void LinkList_sort_Bubble(LinkList a){
	LinkList p,q;
	if(a->next==NULL) return;
	for(p=a->next;p->next!=NULL;p=p->next)
		for(q=a;q->next!=NULL;q=q->next)
			{
				if(q->data>q->next->data) swap(&q->data,&q->next->data);
			}
}

void swap(int *a,int *b){
	int temp;
	temp=*a;
	*a=*b;
	*b=temp;
}
