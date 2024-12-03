module Main where
import Lexer
import Parser
import AST

main :: IO ()
main = do
    txt <- getContents
    print(parser $ alexScanTokens txt)
   
    