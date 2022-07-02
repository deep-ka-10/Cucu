flex cucu.l
bison -d cucu.y
gcc cucu.tab.c lex.yy.c -lfl -o cucu
./cucu $1

