
%{
   
   #include <stdio.h>
   #include <math.h>
   #include "y.tab.h"
   FILE *fout;
   void yyerror(char *);

%}

%%
[\t\n]                      ;
[0-9]+                      {fprintf(fout,"NUM:%s\n",yytext); }

[(int)(char *)]             {fprintf(fout,"TYPE:%s\n",yytext); }
(+|-)                       {fprintf(fout,"ARTH2:%s\n",yytext);}
(*|/)                       {fprintf(fout,"ARTH1:%s\n",yytext); }
\(                          {fprintf(fout,"LP:%s\n",yytext); }
\)                          {fprintf(fout,"RP:%s\n",yytext); }
\{                          {fprintf(fout,"LC:%s\n",yytext); }
\}                          {fprintf(fout,"RC:%s\n",yytext); }       
"="                         {fprintf(fout,"ASSIGN:%s\n",yytext); }
("=="|"!="|"<"|">"|"<="|">=")         {fprintf(fout,"COMPR:%s\n",yytext); }
(if)                        {fprintf(fout,"IF_STMNT:%s\n",yytext); }
(else)                      {fprintf(fout,"ELSE_STMNT:%s\n",yytext); }
(while)                     {fprintf(fout,"WHILE_LOOP:%s\n",yytext); }
(return)                 {fprintf(fout,"RETURN:n",yytext); "                         {fprintf(fout,"SEMICOLUMN:%s\n",yytext); ICOLUMN;}
","                         {fprintf(fout,"COMMA:%s\n",yytext); }
*/*(.)+*/*                  {fprint(fout,"COMMENT:%s",yytext); }
[a-z|A-Z)(a-z|A-Z|0-9|_]+   {fprintf(fout,"ID:%s\n",yytext); }
.                           {yyerror("invalid character"); }

%%
int yywrap(void){
     }
int main(int argc, char **argv)
{
  
yylex();

  
 }