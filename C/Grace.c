#include <stdio.h>
#define s "#include <stdio.h>%1$c#define s %2$c%3$s%2$c%1$c#define m(x) int main(){FILE*f=fopen(x,%2$cw%2$c);fprintf(f,s,10,34,s);fclose(f);}%1$cm(%2$cGrace_kid.c%2$c)//c"
#define m(x) int main(){FILE*f=fopen(x,"w");fprintf(f,s,10,34,s);fclose(f);}
m("Grace_kid.c")//c