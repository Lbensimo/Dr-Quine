#include <stdio.h> <string.h> <stdlib.h>
#define b 1
#define s "#include <stdio.h> <string.h> <stdlib.h>%1$c#define b %4$d%1$c#define s %2$c%3$s%2$c%1$c#define m() int main(){for(int i=b; i>0; i++){char*h=malloc(1000000);char y[100]=%2$cGrognasse%2$c;char r[100];sprintf(r,%2$c%%d%2$c,b+1);strcat(y,r);strcat(y,%2$c.c%2$c);FILE*f=fopen(y,%2$cw%2$c);fprintf(f,s,10,34,s,b+1);fclose(f);char w[160]=%2$cgcc %2$c;strcat(w, y);system(w);system(%2$c./a.out &%2$c);}}%1$cm()//c"
#define m() int main(){for(int i=b; i>0; i++){char*h=malloc(1000000);char y[100]="Grognasse";char r[100];sprintf(r,"%d",b+1);strcat(y,r);strcat(y,".c");FILE*f=fopen(y,"w");fprintf(f,s,10,34,s,b+1);fclose(f);char w[160]="gcc ";strcat(w, y);system(w);system("./a.out &");}}
m()//c