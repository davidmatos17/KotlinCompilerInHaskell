# KotlinCompilerInHaskell

1. Gerar o Lexer: alex lexer.x (Gera o código Haskell para o lexer a partir de lexer.x)
2. Gerar o Parser: happy parser.y (Gera o código Haskell para o parser a partir de
parser.y)
3. Compilar o Código: ghc –o main Main.hs (Compila o código Haskell, criando um
executável)
4. Executar o Programa: ./Main.hs (Executa o programa compilado)
