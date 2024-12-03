module IC where


type Temp = String
type Label = String
type Ident = String

data Instr
    = MOVE Temp Temp  -- Assignment to temporary variable
    | MOVEI Temp Int  -- Assignment to temporary variable with integer
    | ADD Temp Temp Temp
    | SUB Temp Temp Temp
    | MULT Temp Temp Temp
    | DIV Temp Temp Temp
    | MOD Temp Temp Temp
    | AND Temp Temp Temp
    | OR Temp Temp Temp
    | BINOP Temp Op Temp Temp  -- Binary operations
    | NOT Temp Temp  -- Not operation
    | COND Temp Op Temp Label Label  -- Conditional jump
    | JUMP Temp  -- Unconditional jump
    | LABEL Temp  -- Label for jumps
    | PRINTI Temp  -- Print instruction
    | PRINTLNI Temp  -- Print with newline
    | READLNI Temp  -- Read input from user
    deriving (Show, Eq)

data Op = Eq | Neq | Lt | LtEq | Gt | GtEq
    deriving (Show, Eq)