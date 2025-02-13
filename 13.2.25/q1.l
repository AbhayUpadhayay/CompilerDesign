%{
#include <stdio.h>
#include <ctype.h>

int is_keyword(char *str);  // To check if the string is a keyword
%}

%option noyywrap

%%

[a-zA-Z_][a-zA-Z0-9_]*  { 
                            if (is_keyword(yytext)) {
                                printf("'%s' is a keyword, not a valid identifier.\n", yytext);
                            } else {
                                printf("'%s' is a valid identifier.\n", yytext);
                            }
                        }

[0-9]                     { printf("'%s' is not a valid identifier (cannot start with a digit).\n", yytext); }

.                         { /* Ignore any other characters */ }

%%

int is_keyword(char *str) {
    // Define a set of common keywords (can expand this list as needed)
    const char *keywords[] = {"if", "else", "while", "for", "int", "float", "return", "char"};
    
    for (int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if (strcmp(str, keywords[i]) == 0) {
            return 1;  // It's a keyword
        }
    }
    return 0;  // It's not a keyword
}

int main() {
    yylex();  // Start the lexical analysis
    return 0;
}
