%{
  #include <stdio.h>
  int yylex(void);
  void yyerror(char*); 
  FILE *yin;
  FILE *yout; 
    %}
%token  TYPE ID SEMICOLUMN LP RP LC RC LS RS COMMA RETURN ASSIGN NUM IF_STMNT ELSE_STMNT WHILE_LOOP ARTH1 ARTH2 COMPR COMMENT INVALID
%%
program : var_dec {fprintf(yout,"Variable Declaration");}
         | fun_dec {fprintf(yout,"Function Declaration");}
         | fun_def {fprintf(yout,"Function Definition");}
         ;

var_dec : TYPE {fprintf(yout,"Data Type:%s\n",yylval);} ID {fprintf(yout,"Variable name:%s\n",yylval);} SEMICOLUMN 
          ;
fun_dec : TYPE ID {fprintf(yout,"Function Declaration\n");} LP fun_arg RP SEMICOLUMN 
          | TYPE ID {fprintf(yout,"Function Declaration\n");} LP RP SEMICOLUMN 
          ;
fun_def : TYPE ID {fprintf(yout,"Function Definition\n");} LP fun_arg RP LC fun_body RC
          | TYPE ID {fprintf(yout,"Function Definition\n");} LP RP LC fun_body RC
         ; 
fun_arg : TYPE ID {fprintf(yout,"Function Argument:%s",yylval);}
          | fun_arg COMMA TYPE ID {fprintf(yout,"Function Argument:%s",yylval);}
          ;
fun_body : stmnt
           ;
stmnt : var_dec
        | ID {fprintf(yout,"Identifier:%s\n",yylval);} ASSIGN expr SEMICOLUMN
        | ID  LP expr RP SEMICOLUMN {fprintf(yout,"Function Call\n");}
        | RETURN NUM SEMICOLUMN {fprintf(yout,"Return Statement\n");}
        | IF_STMNT LP expr COMPR expr RP {fprintf(yout,"If Statement\n");} LC fun_body RC ELSE_STMNT LC fun_body RC
        | IF_STMNT LP expr COMPR expr RP {fprintf(yout,"If Statement\n");} LC fun_body RC 
        | WHILE_LOOP LP expr COMPR expr RP {fprintf(yout,"Return Statement\n");} LC fun_body RC
        ;
expr :   ID {fprintf(yout,"Variable:%s\n",yylval);}
         |NUM
         |subexpr ARTH2 subexpr
         ;
subexpr :NUM
         |ID {fprintf(yout,"Variable:%s\n",yylval);}  
         |subexpr ARTH1 subexpr         
                     



%%
void yyerror(char *s){
    fprintf(stderr, "%s\n",s);
}
int main(int argc, char **argv){
    yin= fopen(argv[1],"r");
    yout = fopen("parser.txt","w");

    yyparse();

    return ;
}