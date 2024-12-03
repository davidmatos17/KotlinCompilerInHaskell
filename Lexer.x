{
module Lexer where 
}

%wrapper "basic"

$white = [\ \t\n\r]
$digit = [0-9]
$stringChar = [^\n\\] -- Matches any character except double quotes, newline, and backslash

tokens :-  

$white+                                 ;  

\/\/.*                                  ;  

"/*"(\*$white|(\*[^\/])|[^\*]|$white)*"*/"       ; -- skip comments multiple lines


"var"                           { \s -> VAR }
"val"                           { \s -> VAL }
"true"                          { \s -> TRUE }
"false"                         { \s -> FALSE }
"if"                            { \s -> IF }
"else"                          { \s -> ELSE }
"while"                         { \s -> WHILE }
"println"                       { \s -> PRINTLN }
"print"                         { \s -> PRINT }
"readln"                        { \s -> READLN }
"fun"                           { \s -> FUN }
"main"                          { \s -> MAIN }
"+"                             { \s -> PLUS }
"-"                             { \s -> MINUS }
"*"                             { \s -> TIMES }
"/"                             { \s -> DIV }
"%"                             { \s -> MOD }
"("                             { \s -> LPAREN }
")"                             { \s -> RPAREN }
"{"                             { \s -> LBRACKET }
"}"                             { \s -> RBRACKET }         
"="                             { \s -> ASSIGN }
"=="                            { \s -> EQUAL }
"!="                            { \s -> NOTEQUAL }
"!"                             { \s -> NOT }
"||"                            { \s -> OR }
"&&"                            { \s -> AND }
"<"                             { \s -> LESSTHAN }
"<="                            { \s -> LESSEQ }
">"                             { \s -> GREATERTHAN }
">="                            { \s -> GREATEREQ }
[A-Za-z_][A-Za-z0-9_]*          { \s -> IDENT s }
$digit+                         { \s -> NUM (read s) }
\"$stringChar*\"                { \s -> STR (init (tail s)) } -- Match and trim double quotes

{
 -- the token type
data Token
    =  NUM Int           -- Integer literals
    | IDENT String      -- Identifiers (variables)
    | STR String        -- String literals
    | INT               -- 'Int'
    | ASSIGN            -- '='
    | PLUS              -- '+'
    | MINUS             -- '-'
    | TIMES             -- '*'
    | DIV               -- '/'
    | LPAREN            -- '('
    | RPAREN            -- ')'
    | LBRACKET          -- '{'
    | RBRACKET          -- '}'
    | IF                -- 'if'
    | ELSE              -- 'else'
    | WHILE             -- 'while'
    | PRINTLN           -- 'println'
    | PRINT             -- 'print'
    | READLN            -- 'readln'
    | EQUAL             -- '=='
    | NOTEQUAL          -- '!='
    | GREATERTHAN       -- '>'
    | GREATEREQ         -- '>='
    | LESSEQ            -- '<='
    | LESSTHAN          -- '<'
    | TRUE              -- 'true'
    | FALSE             -- 'false'
    | VAR               -- mutable
    | VAL               -- non mutable
    | AND               -- '&' '&'
    | OR                -- '|' '|'
    | NOT               -- '!' 
    | MOD               -- '%'
    | FUN
    | MAIN
    deriving (Show, Eq)
}