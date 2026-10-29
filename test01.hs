{- Haskellでは関数の宣言と実装を別々に書くことができる-}

-- 関数名 :: 引数 -> 返り値
double :: Int -> Int
-- 関数名 引数 = 実装
double x = x * 2

{-
- IO：入出力などの副作用を伴う処理を表す型コンストラクタ（モナド）
- ()：Unit型。意味のある結果の値を持たないことを表す
- IO ()：実行すると副作用が発生し、結果として () を返すアクション
-}
main :: IO ()
-- doで処理を順番に実行している
main = do
    print (double 5)
    print (double 10)
    print (double 15)
    print (double 20)

{- ここから先は、引数を2つに増やしたときに Int -> Int -> Int となる理由や、Haskellではなぜ return が必要ないのか、といった面白い話につながっていく。 -}
