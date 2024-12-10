module MIPS where

import IC
import AST
import CodeGen (generateCode)
import qualified Data.Map as Map
import Data.List (isPrefixOf)
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

-- Check if a name represents a temporary register
isTemporary :: String -> Bool
isTemporary name = isPrefixOf "$t" name

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

irToMips (BINOP dest op src1 src2) =
    case op of
        Eq   -> irToMips (COND src1 Eq src2 (dest ++ "_true") (dest ++ "_false"))
        Neq  -> irToMips (COND src1 Neq src2 (dest ++ "_true") (dest ++ "_false"))
        Lt   -> unlines [ "slt $t0, " ++ src1 ++ ", " ++ src2
                        , "move " ++ dest ++ ", $t0"
                        ]
        Gt   -> unlines [ "slt $t0, " ++ src2 ++ ", " ++ src1
                        , "move " ++ dest ++ ", $t0"
                        ]
        LtEq -> unlines [ "slt $t0, " ++ src2 ++ ", " ++ src1
                        , "xori $t0, $t0, 1"
                        , "move " ++ dest ++ ", $t0"
                        ]
        GtEq -> unlines [ "slt $t0, " ++ src1 ++ ", " ++ src2
                        , "xori $t0, $t0, 1"
                        , "move " ++ dest ++ ", $t0"
                        ]

irToMips (NOT dest src) =
    "nor " ++ dest ++ ", " ++ src ++ ", $zero"

irToMips (COND src1 op src2 trueLabel falseLabel) =
    case op of
        Eq   -> unlines [ "sub $t0, " ++ src1 ++ ", " ++ src2
                        , "beq $t0, $zero, " ++ trueLabel
                        , "j " ++ falseLabel
                        ]
        Neq  -> unlines [ "sub $t0, " ++ src1 ++ ", " ++ src2
                        , "bne $t0, $zero, " ++ trueLabel
                        , "j " ++ falseLabel
                        ]
        Lt   -> unlines [ "slt $t0, " ++ src1 ++ ", " ++ src2
                        , "bne $t0, $zero, " ++ trueLabel
                        , "j " ++ falseLabel
                        ]
        Gt   -> unlines [ "slt $t0, " ++ src2 ++ ", " ++ src1
                        , "bne $t0, $zero, " ++ trueLabel
                        , "j " ++ falseLabel
                        ]
        LtEq -> unlines [ "slt $t0, " ++ src2 ++ ", " ++ src1
                        , "beq $t0, $zero, " ++ falseLabel
                        , "j " ++ trueLabel
                        ]
        GtEq -> unlines [ "slt $t0, " ++ src1 ++ ", " ++ src2
                        , "beq $t0, $zero, " ++ falseLabel
                        , "j " ++ trueLabel
                        ]

irToMips (JUMP label) = "j " ++ label

irToMips (LABEL label) = label ++ ":"

irToMips (PRINTI src) = unlines
    [ "move $a0, " ++ src
    , "li $v0, 4"
    , "syscall"
    ]

irToMips (PRINTLNI src) = unlines
    [ "la $a0, " ++ src -- load the address of the string
    , "li $v0, 4"        -- MIPS syscall to print string
    , "syscall"
    , "la $a0, newline"  -- Print newline
    , "li $v0, 4"
    , "syscall"
    ]

irToMips (READLNI dest) = unlines
    [ "li $v0, 5"
    , "syscall"
    , "move " ++ dest ++ ", $v0"
    ]


extractDataSection :: [Instr] -> String
extractDataSection irList =
    let
        -- Helper to gather strings from PRINTI and PRINTLNI
        gatherStrings :: Instr -> [String]
        gatherStrings (PRINTI src) = [src]
        gatherStrings (PRINTLNI src) = [src]
        gatherStrings _ = []

        -- Collect unique strings and assign labels
        allStrings = concatMap gatherStrings irList
        uniqueStrings = zip (removeDuplicates allStrings) (map (\i -> "str" ++ show i) [0..])

        -- Generate .data declarations for each string
        dataDeclarations = map (\(content, label) -> label ++ ": .asciiz \"" ++ content ++ "\"") uniqueStrings
    in
        unlines dataDeclarations

-- Helper to remove duplicates from a list
removeDuplicates :: (Ord a) => [a] -> [a]
removeDuplicates = go Map.empty
  where
    go _ [] = []
    go seen (x:xs)
        | x `Map.member` seen = go seen xs
        | otherwise = x : go (Map.insert x True seen) xs


-- Generate MIPS assembly from IR
generateMIPS :: [Instr] -> [String]
generateMIPS irList = map irToMips irList

assembleMIPS :: [Instr] -> String
assembleMIPS irList =
    let
        -- Generate the .data section
        dataSection = extractDataSection irList

        -- Generate the .text section from IR instructions
        textSection = map irToMips irList
    in
        unlines $
        [ ".data"                     -- Start of data section
        , dataSection
        , "newline: .asciiz \"\\n\""  -- Add newline string for convenience
        , ".text"                     -- Start of text section
        , ".globl main"               -- Entry point
        , "main:"
        ] ++ textSection ++
        [ "li $v0, 10"                -- Exit syscall
        , "syscall"
        ]
