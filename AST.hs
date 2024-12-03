module AST where
import Lexer
import Control.Monad.State


data Expr
    = Num Int
    | Str String
    | MyTrue 
    | MyFalse 
    | Bool Bool
    | BinOp Op Expr Expr            
    | Ident String                 
    | NotOp Expr      
    -- objetos necessarios para o ficheiro CodeGen.hs
    | Array String Expr 

    deriving (Show, Eq)
 

-- Binary operations
data Op
    = Add
    | Sub
    | Mul
    | Div
    | Mod
    | Greater
    | Less
    | Equal
    | NotEqual
    | GreaterEq
    | LessEq
    | And
    | Or
    | Not 
    deriving (Show, Eq)

-- AST for statements
data Stmt
    = Assign String Expr
    | Var String Expr
    | Val String Expr
    | VarReadLn String ReadLn
    | ValReadLn String ReadLn
    | If Expr Stmt
    | IfElse Expr Stmt Stmt
    | While Expr Stmt
    | Print PrintArg
    | Println PrintArg
    | ExprStmt Expr
    | Fun [String] [Stmt]
    | Main Stmt
    | Block [Stmt] 
    deriving (Show, Eq)

data ReadLn = ReadLn 
 deriving (Show, Eq)

data PrintArg = PrintExp Expr 
              deriving (Show,Eq)

