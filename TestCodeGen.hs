import CodeGen
import AST
import Control.Monad.State

-- Example program: x = 10; y = 20; z = x + y; print(z);
exampleProgram :: Stmt
exampleProgram = Block [Var "contador" (Num 1),While (BinOp LessEq (Ident "contador") (Num 5)) (Block [Print (PrintExp (Str "Contagem: ")),Println (PrintExp (Ident "contador")),Assign "contador" (BinOp Add (Ident "contador") (Num 1))]),Println (PrintExp (Str "Fim da contagem"))]

-- Main function to run the code generation
main :: IO ()
main = do
    let generatedCode = generateCode [exampleProgram]  -- Generate IR code for the example program
    putStrLn "Generated Intermediate Code:"
    mapM_ print generatedCode  -- Print each instruction in the generated code
