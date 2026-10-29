-- Haskellでは、一般的な「値を返却する」という概念がない
-- ※ ただし、returnという命令文はある

-- 引数が結果になる
double :: Int -> Int
double x = x * 2

-- この場合なら、addedが結果になる
calculate :: Int -> Int
calculate x =
    let doubled = x * 2
        added = doubled + 10
     in added

{- 式を評価すると値が得られるという考え方だね。 -}

main :: IO ()
main = do
    print (calculate 10) -- 30
