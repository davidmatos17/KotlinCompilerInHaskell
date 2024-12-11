module Main where

import Lexer         -- Your lexical analyzer
import Parser        -- Your parser
import AST           -- Abstract Syntax Tree representation
import CodeGen       -- Intermediate code generation
import Control.Monad.State
import qualified Data.Map as Map
import MIPS 

main :: IO ()
main = do
    -- Step 1: Read program input (e.g., Kotlin-like code)
    putStrLn "Enter your program (end with Ctrl+D):"
    txt <- getContents
    
    -- Step 2: Lexical Analysis
    let tokens = alexScanTokens txt
    putStrLn "\nLexical Analysis (Tokens):"
    print tokens

    -- Step 3: Parsing
    let ast = parser tokens
    putStrLn "\nParsed Abstract Syntax Tree (AST):"
    print ast

    -- Step 4: Intermediate Code Generation
    let irCode = generateCode [ast]
    putStrLn "\nGenerated Intermediate Code (IR):"
    mapM_ print irCode

    -- Step 5: Assembly Code Generation
    let assemblyCode = assembleMIPS irCode
    putStrLn "\nGenerated Assembly Code:"
    putStrLn assemblyCode

    -- Step 6: Save output to a .asm file
    let outputPath = "output.asm"
    writeFile outputPath assemblyCode
    putStrLn $ "Assembly code has been saved to " ++ outputPath

