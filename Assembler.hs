module Assembler where
import Binary
import IC
import Data.Maybe
import Data.Char (toLower)
import Data.List (stripPrefix)
import Numeric (showIntAtBase)
import Data.Char (intToDigit)

opcodeTable :: [(String, String)]
opcodeTable = [
    ("add", "000000"),
    ("sub", "000000"),
    ("lw", "100011"),
    ("sw", "101011"),
    ("j", "000010"),
    ("beq", "000100"),
    ("bne", "000101"),
    ("and", "000000"),
    ("or", "000000"),
    ("slt", "000000"),
    ("jr", "000000"),
    ("sll", "000000"),
    ("srl", "000000"),
    ("addi", "001000"),
    ("ori", "001101"),
    ("lui", "001111"),
    ("slti", "001010"),
    ("andi", "001100"),
    ("bgtz", "000111"),
    ("blez", "000110"),
    ("jal", "000011")
    -- Add more instructions
  ]

functTable :: [(String, String)]
functTable = [
    ("add", "100000"),
    ("sub", "100010"),
    ("and", "100100"),
    ("or", "100101"),
    ("slt", "101010"),
    ("jr", "001000"),
    ("sll", "000000"),
    ("srl", "000010")
  ]
    -- Add more R-type functions

registerTable :: [(String, String)]
registerTable = [
    ("t0", "01000"),
    ("t1", "01001"),
    ("t2", "01010"),
    ("t3", "01011"),
    ("t4", "01100"),
    ("t5", "01101"),
    ("t6", "01110"),
    ("t7", "01111"),
    ("t8", "11000"),
    ("t9", "11001"),
    ("s0", "10000"),
    ("s1", "10001"),
    ("s2", "10010"),
    ("s3", "10011"),
    ("s4", "10100"),
    ("s5", "10101"),
    ("s6", "10110"),
    ("s7", "10111"),
    ("zero", "00000"),
    ("at", "00001"),
    ("v0", "00010"),
    ("v1", "00011"),
    ("a0", "00100"),
    ("a1", "00101"),
    ("a2", "00110"),
    ("a3", "00111"),
    ("k0", "11010"),
    ("k1", "11011"),
    ("gp", "11100"),
    ("sp", "11101"),
    ("fp", "11110"),
    ("ra", "11111")
    -- Add all registers
  ]


trim :: String -> String
trim = f . f
   where f = reverse . dropWhile (== ' ')

normalizeRegister :: String -> String
normalizeRegister = map toLower . trim

regBin :: String -> String
regBin reg =
  let normalizedReg = normalizeRegister reg
  in case lookup normalizedReg registerTable of
       Just bin -> bin
       Nothing -> error $ "Unknown register: " ++ normalizedReg


-- Convert immediate to binary string (e.g., "16" -> "0000000000010000")
immBin :: String -> String
immBin imm = let n = read imm :: Int
             in padBinary 16 (toBinary n)

-- Convert address to binary string (e.g., "100" -> "00000000000000000000000100")
addrBin :: String -> String
addrBin addr = let n = read addr :: Int
               in padBinary 26 (toBinary n)

-- Helper to convert integer to binary string
toBinary :: Int -> String
toBinary n = let bin = showIntAtBase 2 intToDigit n ""
             in if n < 0 then error "Negative numbers not supported" else bin

-- Helper to pad binary strings to a fixed length
padBinary :: Int -> String -> String
padBinary len bin = replicate (len - length bin) '0' ++ bin


encodeInstruction :: Instruction -> String
encodeInstruction instr =
  case instrType instr of
    RType -> encodeRType instr
    IType -> encodeIType instr
    JType -> encodeJType instr

encodeRType :: Instruction -> String
encodeRType instr =
  let op = opcode instr
      rsBin = maybe "00000" id (rs instr)
      rtBin = maybe "00000" id (rt instr)
      rdBin = maybe "00000" id (rd instr)
      shamtBin = maybe "00000" id (shamt instr)
      functBin = maybe "000000" id (funct instr)
  in op ++ rsBin ++ rtBin ++ rdBin ++ shamtBin ++ functBin

encodeIType :: Instruction -> String
encodeIType instr =
  let op = opcode instr
      rsBin = maybe "00000" id (rs instr)
      rtBin = maybe "00000" id (rt instr)
      immBin = maybe "0000000000000000" id (immediate instr)
  in op ++ rsBin ++ rtBin ++ immBin

encodeJType :: Instruction -> String
encodeJType instr =
  let op = opcode instr
      addrBin = maybe "00000000000000000000000000" id (address instr)
  in op ++ addrBin


-- parseInstruction :: String -> Instruction
-- parseInstruction line =
--   let tokens = words line
--       mnemonic = head tokens
--       operands = tail tokens
--       opcode =  fromMaybe (error $ "Unknown opcode: " ++ mnemonic) (lookup mnemonic opcodeTable)
--       instrType = determineType mnemonic
--   in case instrType of
--        RType -> Instruction RType opcode (Just $ regBin $ operands !! 0) 
--                                               (Just $ regBin $ operands !! 1) 
--                                               (Just $ regBin $ operands !! 2) 
--                                               (Just "00000") 
--                                               (lookup mnemonic functTable)
--                                               Nothing 
--                                               Nothing
--        IType -> Instruction IType opcode (Just $ regBin $ operands !! 0) 
--                                               (Just $ regBin $ operands !! 1) 
--                                               Nothing 
--                                               Nothing 
--                                               Nothing 
--                                               (Just $ immBin $ operands !! 2)
--        JType -> Instruction JType opcode Nothing Nothing Nothing Nothing Nothing Nothing (Just $ addrBin $ operands !! 0)

-- parseInstruction :: String -> Instruction
-- parseInstruction line =
--   let tokens = words line
--       mnemonic = head tokens
--       operands = tail tokens
--       opcode = fromMaybe (error $ "Unknown opcode: " ++ mnemonic) (lookup mnemonic opcodeTable)
--       instrType = determineType mnemonic
--       rsBin = Just $ regBin $ operands !! 0
--       rtBin = Just $ regBin $ operands !! 1
--       rdBin = Just $ regBin $ operands !! 2
--   in case instrType of
--        RType -> Instruction RType opcode 
--             rsBin  rtBin  rdBin (Just "00000")
--             (Just $ fromMaybe (error "Unknown funct") (lookup mnemonic functTable)) 
--             Nothing Nothing
--        IType -> Instruction IType opcode 
--             rsBin  rtBin Nothing Nothing Nothing 
--             (Just $ immBin $ operands !! 2)
--        JType -> Instruction JType opcode 
--             Nothing Nothing Nothing Nothing Nothing Nothing 
--             (Just $ addrBin $ operands !! 0)

parseInstruction :: String -> Instruction
parseInstruction line =
  let tokens = words line
      mnemonic = head tokens
      operands = tail tokens
      opcode = fromMaybe (error $ "Unknown opcode: " ++ mnemonic) (lookup mnemonic opcodeTable)
      instrType = determineType mnemonic
      -- Assuming all instructions have at least 3 operands for R and I types, and 1 for J type
      rsBin = Just $ regBin $ operands !! 0
      rtBin = Just $ regBin $ operands !! 1
      rdBin = if instrType == RType then Just $ regBin $ operands !! 2 else Nothing
      shamtBin = Just "00000"  -- Assuming no shift amount
      functBin = case instrType of
                   RType -> Just $ fromMaybe (error "Unknown funct") (lookup mnemonic functTable)
                   _     -> Nothing
      immBinVal = if instrType == IType then Just $ immBin $ operands !! 2 else Nothing
      addrBinVal = if instrType == JType then Just $ addrBin $ operands !! 0 else Nothing
  in case instrType of
       RType -> Instruction RType opcode 
            rsBin rtBin rdBin shamtBin functBin Nothing Nothing
       IType -> Instruction IType opcode 
            rsBin rtBin Nothing Nothing Nothing 
            immBinVal Nothing
       JType -> Instruction JType opcode 
            Nothing Nothing Nothing Nothing Nothing Nothing 
            addrBinVal



-- Helper to determine instruction type
determineType :: String -> InstructionType
determineType mnemonic
  | mnemonic `elem` ["add", "sub"] = RType
  | mnemonic `elem` ["lw","lui", "sw"]   = IType
  | mnemonic `elem` ["j"]          = JType
  | otherwise = error $ "Unknown instruction type: " ++ mnemonic