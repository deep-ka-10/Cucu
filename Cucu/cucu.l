
%{
   
   #include <stdio.h>
   #include <math.h>
   #include "cucu.tab.h"
   FILE *fout;
   FILE *fin;
   void yyerror(char *);

%}

%%
[\t\n]                      
[0-9]+                      {fprintf(fout,"Num:%s\n",yytext);return NUM;}

"int"|"char \*"             {fprintf(fout,"Type:%s\n",yytext);return TYPE;}
(\+|\-)                       {fprintf(fout,"Arth2:%s\n",yytext);return ARTH2;}
(\*|\/)                       {fprintf(fout,"Arth1:%s\n",yytext);return ARTH1;}
\(                          {fprintf(fout,"LP:%s\n",yytext);return LP;}
\)                          {fprintf(fout,"Rp:%s\n",yytext);return RP;}
\{                          {fprintf(fout,"Lc:%s\n",yytext);return LC;}
\}                          {fprintf(fout,"Rc:%s\n",yytext);return RC;} 
\[                          {fprintf(fout,"Ls:%s\n",yytext);return LS;}
\]                          {fprintf(fout,"Rs:%s\n",yytext);return RS;}       
"="                         {fprintf(fout,"Assign:%s\n",yytext);return ASSIGN;}
("=="|"!="|"<"|">"|"<="|">=")         {fprintf(fout,"COMPR:%s\n",yytext);return COMPR;}
(if)                        {fprintf(fout,"IF_STMNt:%s\n",yytext);return IF_STMNT;}
(else)                      {fprintf(fout,"ELSE_STMNt:%s\n",yytext);return ELSE_STMNT;}
(while)                     {fprintf(fout,"WHILE_LOOp:%s\n",yytext);return WHILE_LOOP;}
(return)                    {fprintf(fout,"RETURn:%s\n",yytext);return RETURN;}
";"                         {fprintf(fout,"SEMICOLUMn:%s\n",yytext);return SEMICOLUMN;}
","                         {fprintf(fout,"COMMa:%s\n",yytext);return COMMA;}
[a-z|A-Z)(a-z|A-Z|0-9|_]+   {fprintf(fout,"Id:%s\n",yytext);return ID;}
\/\*.*\*\/                     {fprintf(fout,"COMMENt:%s\n",yytext);return COMMENT;}
.                           {yyerror("invalid character");return INVALID;}

%%
int yywrap(void){
    return 1;
}
void yyerror( char *check){
  printf("Lexical Error");
}
