{
module Parser where
import Lexer
import AST
import Control.Monad.State
}

%name parser
%tokentype { Token }
%error { parseError }

%token

num             { NUM $$ }
"+"             { PLUS }
"-"             { MINUS }
"*"             { TIMES }
"/"             { DIV }
"%"             { MOD }
"("             { LPAREN }
")"             { RPAREN }
"{"             { LBRACKET }
"}"             { RBRACKET }
"="             { ASSIGN }
"=="            { EQUAL }
"!="            { NOTEQUAL }
"<"             { LESSTHAN }
"<="            { LESSEQ }
">"             { GREATERTHAN }
">="            { GREATEREQ }
"!"             { NOT }
"||"            { OR }
"&&"            { AND }
"true"          { TRUE }
"false"         { FALSE }
"if"            { IF }
"else"          { ELSE }
"while"         { WHILE }
"var"           { VAR }
"val"           { VAL }
"println"       { PRINTLN }
"print"         { PRINT }
"readln"        { READLN }
"fun"           { FUN }
"main"          { MAIN }
id              { IDENT $$ }
str             { STR $$ }

%nonassoc "else"
%nonassoc "==" "!=" "<" "<=" ">" ">=" "||" "&&" 
%left "+" "-"
%left "*" "/" "%"
%right "!"

%%

Start : "fun" "main" "(" ")" Block                      { Main $5 }


Block : "{" Blstm "}"                                   { Block $2 }
      | "{" "}"                                         { Block [] }

Blstm : Stm Blstm                                       { $1 : $2 }
      | Stm                                             { [$1] }

ExpStmt : Exp                                           { ExprStmt $1 }

PrintStmt : "print" "(" PrintArg ")"                    { Print $3 }
          | "println" "(" PrintArg ")"                  { Println $3 }

Stm : Block                                             { $1 }
    | ExpStmt                                           { $1 }
    | VarValDecl                                        { $1 }
    | Assi                                              { $1 }
    | Iff                                               { $1 }
    | Wh                                                { $1 }
    | PrintStmt                                         { $1 }
    | ReadLn                                            { $1 }

PrintArg : Exp                                          { PrintExp $1 }

VarValDecl : "var" id "=" Exp                           { Var $2 $4 }
           | "val" id "=" Exp                           { Val $2 $4 }
           

Assi : id "=" Exp                                       { Assign $1 $3 }


Iff : "if" "(" Exp ")" Stm                              { If $3 $5 }
    | "if" "(" Exp ")" Stm "else" Stm                   { IfElse $3 $5 $7 }


Wh : "while" "(" Exp ")" Stm                            { While $3 $5 }

ReadLn : "var" id "=" "readln""(" ")"                   { VarReadLn $2 ReadLn }
       | "val" id "=" "readln""(" ")"                   { VarReadLn $2 ReadLn }

Str : str                                               { Str $1 }    

Exp   : Term                                            { $1 }
      | Exp "+" Exp                                     { BinOp Add $1 $3 }
      | Exp "-" Exp                                     { BinOp Sub $1 $3 }
      | Exp "*" Exp                                     { BinOp Mul $1 $3 }
      | Exp "/" Exp                                     { BinOp Div $1 $3 }
      | Exp "%" Exp                                     { BinOp Mod $1 $3 }
      | Exp "==" Exp                                    { BinOp Equal $1 $3 }
      | Exp "!=" Exp                                    { BinOp NotEqual $1 $3 }
      | Exp "<" Exp                                     { BinOp Less $1 $3 }
      | Exp "<=" Exp                                    { BinOp LessEq $1 $3 }
      | Exp ">" Exp                                     { BinOp Greater $1 $3 }
      | Exp ">=" Exp                                    { BinOp GreaterEq $1 $3 }
      | Exp "||" Exp                                    { BinOp Or $1 $3 }
      | Exp "&&" Exp                                    { BinOp And $1 $3 }
      | "!" Term                                        { NotOp $2 }


Term    : num                                           { Num $1 }
        | Str                                           { $1 }
        | id                                            { Ident $1 }
        | "true"                                        { MyTrue }
        | "false"                                       { MyFalse }
        | "(" Exp ")"                                   { $2 }


{
parseError :: [Token] -> a
parseError toks = error "parse error"
}
