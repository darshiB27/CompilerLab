%{
#include <stdio.h>

int characters = 0;
int words = 0;
int lines = 0;
%}

%%

\n          { lines++; characters++; }
[ \t]+      { characters += yyleng; }
[a-zA-Z0-9]+ { words++; characters += yyleng; }
.           { characters++; }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the text (Press Ctrl+D to finish):\n\n");
    
    yylex();
    
    printf("\n");
    printf("Characters = %d\n", characters);
    printf("Words      = %d\n", words);
    printf("Lines      = %d\n", lines);
    
    return 0;
}
