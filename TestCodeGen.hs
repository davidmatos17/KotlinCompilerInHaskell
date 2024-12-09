import CodeGen
import AST
import Assembler
import Control.Monad.State

-- Example program: x = 10; y = 20; z = x + y; print(z);
exampleProgram :: Stmt
exampleProgram = (Block [Var "x" (Num 4),Var "y" (Num 3),Var "soma" (BinOp Add (Ident "x") (Ident "y"))])
-- Main function to run the code generation
-- main :: IO ()
-- main = do
--     let generatedCode = generateCode [exampleProgram]  -- Generate IR code for the example program
--     putStrLn "Generated Intermediate Code:"
--     mapM_ print generatedCode  -- Print each instruction in the generated code
--     putStrLn "Binary Code"
--     let instructions = parseInstruction [generatedCode]
--     mapM_ print instructions


 
main :: IO ()
main = do
    let irCode = generateCode [exampleProgram]  -- Generate IR code
    putStrLn "Generated Intermediate Code:"
    mapM_ print irCode  -- Print IR code
    putStrLn "\nGenerated Assembly:"
    let assemblyCode = generateAssembly irCode  -- Convert IR to assembly
    mapM_ putStrLn assemblyCode
    -- putStrLn "\nGenerated Binary:"
    -- let binaryCode = map (encodeInstruction . parseInstruction) assemblyCode
    -- mapM_ putStrLn binaryCode

