double :: Int -> Int
double x = x * 2

doubleAll :: [Int] -> [Int]
doubleAll x = map (* 2) x

main :: IO ()
main =
    do
        let numbers = [1, 2, 3, 4, 5]
        -- filter
        print (filter (\x -> x > 2) numbers)
        -- map
        print (map (\x -> x * 2) numbers)

        -- 省略形
        print (filter (> 2) numbers)
        -- 省略形
        print (map (* 2) numbers)

        -- 関数を繋げるには？
        let results = filter (> 2) (map (* 2) numbers)
        print (results)

        -- filter->mapをしたかったのに👆のように書いてしまった
        -- 上のコードでfilter (> 2)の後に登場する()はよくあるメソッドの引数を入れるための()ではなく、
        -- 四則演算の優先度をあげる()と同じ
        -- だから、やりたかったこととしては、こう👇
        let results = map (* 2) (filter (> 2) numbers)
        print (results)

        -- もっと繋げる
        print (map (* 2) (filter (> 2) numbers))

        -- Haskellにおいて、関数の実行優先度はどの四則演算よりも高い
        -- 今までのプログラミング言語なら、感覚的に2+3で5になった整数を2倍するから10になりそうなところ、
        -- Haskellでは先にdouble 2で4になったところに+3するので、実行結果は7
        print (double 2 + 3)

        -- 10にしたかったらこう
        print (double (2 + 3))

        -- 関数の合成（射の合成）
        -- [Int] - filter - > [Int] - map -> [Int]
        -- という圏と射の関係だったわけだから、Haskellが圏論に基づいているのであれば、
        -- filter・mapという関数（射）は合成できるはず
        let results = (map (* 2) . filter (> 2)) numbers
        print (results)

        -- できた
        -- もちろん複数の関数を繋げることも
        print ((map (> 9) . map (* 2) . filter (> 2)) numbers)

        -- mapを使った自作関数を呼び出す
        print (doubleAll [1 .. 5])

        (print . doubleAll) [1 .. 5]
