module Binary where

data InstructionType = RType | IType | JType
  deriving (Show, Eq)

data Instruction = Instruction {
    instrType :: InstructionType,
    opcode    :: String, -- Binary string
    rs        :: Maybe String,
    rt        :: Maybe String,
    rd        :: Maybe String,
    shamt     :: Maybe String,
    funct     :: Maybe String,
    immediate :: Maybe String,
    address   :: Maybe String
} deriving (Show, Eq)


