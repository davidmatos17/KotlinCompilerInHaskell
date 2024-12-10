
module CodeGen where

import AST
import IC 
import Control.Monad.State
import qualified Data.Map as Map

-- Symbol table type to map identifiers to temporaries
type SymTable = Map.Map String String

-- Code generation state
data CodeGenState = CodeGenState
    { tempCount :: Int
    , savedCount :: Int
    , labelCount :: Int
    , instructions :: [Instr]
    , symTable :: SymTable
    , stringLabels :: Map.Map String String
    } deriving (Show)

-- Monad definition for code generation
type CodeGen = State CodeGenState

-- Generate a new temporary variable
newTemp :: CodeGen String
newTemp = do
    state <- get
    let temp = "$t" ++ show (tempCount state)
    put state { tempCount = tempCount state + 1 }
    return temp

newSaveTemp :: CodeGen String
newSaveTemp = do
    state <- get
    let temp = "$s" ++ show (savedCount state)
    put state { savedCount = savedCount state + 1 }
    return temp

-- Generate a new label
newLabel :: CodeGen String
newLabel = do
    state <- get
    let label = "L" ++ show (labelCount state)
    put state { labelCount = labelCount state + 1 }
    return label

-- Emit an instruction
emit :: Instr -> CodeGen ()
emit instr = do
    state <- get
    put state { instructions = instructions state ++ [instr] }


addString :: String -> CodeGen String
addString str = do
    state <- get
    let labels = stringLabels state
    case Map.lookup str labels of
        Just label -> return str  -- String already has a label
        Nothing -> do
            let label = "msg" ++ show (Map.size labels)
            put state { stringLabels = Map.insert str label labels }
            return str




-- Translate expressions
transExpr :: Expr -> CodeGen Temp
transExpr (Num n) = do
    temp <- newTemp
    emit (MOVEI temp n)
    return temp

transExpr (Str s) = do
    label <- addString s  -- Add string to .data and get its label
    return label

transExpr MyTrue = do
    temp <- newTemp
    emit (MOVEI temp 1)  -- True is represented as 1
    return temp

transExpr MyFalse = do
    temp <- newTemp
    emit (MOVEI temp 0)  -- False is represented as 0
    return temp

transExpr (Bool b) = do
    temp <- newTemp
    emit (MOVEI temp (if b then 1 else 0))
    return temp

transExpr (Ident name) = return name

transExpr (BinOp Add lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (ADD temp lhsTemp rhsTemp)
    return temp

transExpr (BinOp Sub lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (SUB temp lhsTemp rhsTemp)
    return temp

transExpr (BinOp Mul lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (MULT temp lhsTemp rhsTemp)
    return temp

transExpr (BinOp Div lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (DIV temp lhsTemp rhsTemp)
    return temp

transExpr (BinOp Mod lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (MOD temp lhsTemp rhsTemp)
    return temp

transExpr (BinOp Greater lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (BINOP temp Gt lhsTemp rhsTemp)
    return temp

transExpr (BinOp Less lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (BINOP temp Lt lhsTemp rhsTemp)
    return temp

transExpr (BinOp Equal lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (BINOP temp Eq lhsTemp rhsTemp)
    return temp

transExpr (BinOp NotEqual lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (BINOP temp Neq lhsTemp rhsTemp)
    return temp

transExpr (BinOp GreaterEq lhs rhs) = do
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (COND lhsTemp GtEq rhsTemp "1" "0")
    return temp

transExpr (BinOp LessEq lhs rhs) = do  
    lhsTemp <- transExpr lhs
    rhsTemp <- transExpr rhs
    temp <- newTemp
    emit (COND lhsTemp LtEq rhsTemp "1" "0")
    return temp

transExpr (NotOp expr) = do
    exprTemp <- transExpr expr
    temp <- newTemp
    emit (NOT temp exprTemp)
    return temp

transExpr (Array name index) = do
    indexTemp <- transExpr index
    temp <- newTemp
    emit (MOVE temp (name ++ "[" ++ indexTemp ++ "]"))
    return temp

-- Translate statements
transStmt :: Stmt -> CodeGen ()
transStmt (Assign name expr) = do
    exprTemp <- transExpr expr
    saveTemp <- newSaveTemp  -- Use saved register
    emit (MOVE saveTemp exprTemp)

transStmt (Var name expr) = do
    exprTemp <- transExpr expr
    saveTemp <- newSaveTemp  -- Use saved register
    emit (MOVE saveTemp exprTemp)  -- Store in saved register

transStmt (Val name expr) = do
    exprTemp <- transExpr expr
    saveTemp <- newSaveTemp  -- Use saved register
    emit (MOVE saveTemp exprTemp)  -- Store in saved register

transStmt (VarReadLn name ReadLn) = do
    temp <- newTemp
    emit (READLNI temp)
    emit (MOVE name temp)

transStmt (ValReadLn name ReadLn) = do
    temp <- newTemp
    emit (READLNI temp)
    emit (MOVE name temp)

transStmt (If cond trueStmt) = do
    condTemp <- transExpr cond
    labelTrue <- newLabel
    labelEnd <- newLabel
    emit (COND condTemp Eq "1" labelTrue labelEnd)
    emit (LABEL labelTrue)
    transStmt trueStmt
    emit (LABEL labelEnd)

transStmt (IfElse cond trueStmt falseStmt) = do
    condTemp <- transExpr cond
    labelTrue <- newLabel
    labelFalse <- newLabel
    labelEnd <- newLabel
    emit (COND condTemp Eq "1" labelTrue labelFalse)
    emit (LABEL labelFalse)
    transStmt falseStmt
    emit (JUMP labelEnd)
    emit (LABEL labelTrue)
    transStmt trueStmt
    emit (LABEL labelEnd)

transStmt (While cond body) = do
    labelStart <- newLabel
    labelEnd <- newLabel
    emit (LABEL labelStart)
    condTemp <- transExpr cond
    emit (COND condTemp Eq "1" labelStart labelEnd)
    transStmt body
    emit (JUMP labelStart)
    emit (LABEL labelEnd)

transStmt (Print (PrintExp expr)) = do
    exprTemp <- transExpr expr
    emit (PRINTI exprTemp)  -- exprTemp is the string label

transStmt (Println (PrintExp expr)) = do
    exprTemp <- transExpr expr
    emit (PRINTLNI exprTemp)  -- exprTemp is the string label

transStmt (ExprStmt expr) = do
    _ <- transExpr expr
    return ()

transStmt (Fun _ _) = return ()  -- Handling for functions, can be extended if needed

transStmt (Main stmt) = transStmt stmt

transStmt (Block stmts) = mapM_ transStmt stmts
-- Entry point for code generation
generateCode :: [Stmt] -> [Instr]
generateCode stmts =
    let initialState = CodeGenState 0 0 0 [] Map.empty Map.empty
        finalState = execState (mapM_ transStmt stmts) initialState
    in instructions finalState


