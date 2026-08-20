%{
#include <stdio.h>
%}

%%
"if"|"else"|"while"|"for"|"int"|"float"     { printf("Keyword\n"); }
[a-zA-Z_][a-zA-Z0-9_]*                      { printf("Identifier\n"); }
[0-9]+                                      { printf("Integer\n"); }
[0-9]+"."[0-9]+                             { printf("Floating Point Number\n"); }
[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+"."[a-zA-Z]{2,} { printf("Email Address\n"); }
[ \t\n]                                     { /* Ignore spaces, tabs, and newlines */ }
.                                           { printf("Invalid String\n"); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a string:\n");
    yylex();
    return 0;
}
