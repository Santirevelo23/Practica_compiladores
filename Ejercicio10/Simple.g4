grammar Simple;

prog: classDef+ ;

classDef
    : 'class' ID '{' member+ '}' 
    ;

member
    : 'int' ID ';'
    | 'int' ID '(' ID ')' '{' stat '}' 
    ;

stat
    : expr ';'
    | ID '=' expr ';'
    ;

expr
    : expr ('+' | '-') expr  # AddSub
    | expr ('*' | '/') expr  # MulDiv
    | INT                   # Int
    | ID '(' INT ')'         # FunCall
    | ID                     # Var
    | '(' expr ')'           # Parents
    ;

INT : [0-9]+ ;
ID  : [a-zA-Z]+ ;
WS  : [ \t\r\n]+ -> skip ;