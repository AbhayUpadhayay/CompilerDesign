%{
#include <stdio.h>
%}

%%
[a-zA-Z]+  { printf("You entered: %s\n", yytext); }

[\n]        { /* Ignore new lines */ }
.          { /* Ignore other characters */ }
%%

int main() {
    printf("Enter a name: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
