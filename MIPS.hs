module MIPS where

import IC
import AST
import CodeGen (generateCode)
import qualified Data.Map as Map
import Control.Monad.State

-- Define MIPS registers
data Register = T0 | T1 | T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9
              | S0 | S1 | S2 | S3 | S4 | S5 | S6 | S7
              | A0 | A1 | A2 | A3
              | V0 | V1
              | Zero
              deriving (Show, Eq)

-- Generate MIPS register names
regName :: Register -> String
regName reg = case reg of
    T0 -> "$t0"; T1 -> "$t1"; T2 -> "$t2"; T3 -> "$t3"; T4 -> "$t4"
    T5 -> "$t5"; T6 -> "$t6"; T7 -> "$t7"; T8 -> "$t8"; T9 -> "$t9"
    S0 -> "$s0"; S1 -> "$s1"; S2 -> "$s2"; S3 -> "$s3"; S4 -> "$s4"
    S5 -> "$s5"; S6 -> "$s6"; S7 -> "$s7"
    A0 -> "$a0"; A1 -> "$a1"; A2 -> "$a2"; A3 -> "$a3"
    V0 -> "$v0"; V1 -> "$v1"
    Zero -> "$zero"

-- Map intermediate code instructions to MIPS assembly
-- Generate MIPS assembly for each IR instruction
-- Generate MIPS assembly for each IR instruction
irToMips :: Instr -> String
irToMips (MOVE dest src) = "move " ++ dest ++ ", " ++ src
irToMips (MOVEI dest val) = "li " ++ dest ++ ", " ++ show val
irToMips (ADD dest src1 src2) = "add " ++ dest ++ ", " ++ src1 ++ ", " ++ src2
irToMips (SUB dest src1 src2) = "sub " ++ dest ++ ", " ++ src1 ++ ", " ++ src2
irToMips (MULT dest src1 src2) = "mul " ++ dest ++ ", " ++ src1 ++ ", " ++ src2
irToMips (DIV dest src1 src2) = "div " ++ dest ++ ", " ++ src1 ++ ", " ++ src2
irToMips (MOD dest src1 src2) = "rem " ++ dest ++ ", " ++ src1 ++ ", " ++ src2
irToMips (AND dest src1 src2) = "and " ++ dest ++ ", " ++ src1 ++ ", " ++ src2
irToMips (OR dest src1 src2) = "or " ++ dest ++ ", " ++ src1 ++ ", " ++ src2
irToMips (BNE src1 src2 label) = "bne " ++ src1 ++ ", " ++ src2 ++ ", " ++ label
irToMips (BEQ src1 src2 label) = "beq " ++ src1 ++ ", " ++ src2 ++ ", " ++ label
irToMips (PRINTI src) = unlines
    [ "move $a0, " ++ src
    , "li $v0, 1"   -- syscall for printing integers
    , "syscall"
    ]
irToMips (PRINTLNI src) = unlines
    [ irToMips (PRINTI src)
    , "li $a0, 10"  -- newline character
    , "li $v0, 11"  -- syscall for printing a character
    , "syscall"
    ]
irToMips (READLNI dest) = unlines
    [ "li $v0, 5"    -- syscall for reading an integer
    , "syscall"
    , "move " ++ dest ++ ", $v0"
    ]

-- Add support for conditional and loop-like structures
irToMips (COND src1 op src2 trueLabel falseLabel) =
    case op of
        Eq   -> irToMips (BEQ src1 src2 trueLabel) ++ "\n" ++ irToMips (JUMP falseLabel)
        Neq  -> irToMips (BNE src1 src2 trueLabel) ++ "\n" ++ irToMips (JUMP falseLabel)
        Lt   -> unlines [ "slt $t0, " ++ src1 ++ ", " ++ src2
                        , "bne $t0, $zero, " ++ trueLabel
                        , "j " ++ falseLabel
                        ]
        LtEq -> unlines [ "sle $t0, " ++ src1 ++ ", " ++ src2
                        , "bne $t0, $zero, " ++ trueLabel
                        , "j " ++ falseLabel
                        ]
        Gt   -> unlines [ "sgt $t0, " ++ src1 ++ ", " ++ src2
                        , "bne $t0, $zero, " ++ trueLabel
                        , "j " ++ falseLabel
                        ]
        GtEq -> unlines [ "sge $t0, " ++ src1 ++ ", " ++ src2
                        , "bne $t0, $zero, " ++ trueLabel
                        , "j " ++ falseLabel
                        ]

-- Now handle LABEL and JUMP in a more specific, non-overlapping way
-- We don't need separate pattern matching for LABEL and JUMP if we simply output them directly in the relevant cases.

irToMips (LABEL label) = label ++ ":"

irToMips (JUMP label) = "j " ++ label

-- Generate MIPS assembly from IR
generateMIPS :: [Instr] -> [String]
generateMIPS irList = map irToMips irList

-- Create full MIPS assembly program with a text segment
assembleMIPS :: [Instr] -> String
assembleMIPS irList = unlines $
    [ ".data"
    , "newline: .asciiz \"\\n\""
    , ".text"
    , ".globl main"
    , "main:"
    ] ++ generateMIPS irList ++
    [ "li $v0, 10"  -- syscall to exit program
    , "syscall"
    ]
