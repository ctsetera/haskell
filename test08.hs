import Data.Function ((&))

-- 関数結合でのみこの記述ができる、
-- が、下のmyFunc2とやっていることに変わりはないので特に意味はない
myFunc :: [a] -> [a]
myFunc = take 3 . reverse

-- ちな、上のaはジェネリクス　Haskellでは、小文字で始まればすべてジェネリクス
-- だから、こんなのでもいい
myFunc2 :: [generics] -> [generics]
myFunc2 xs = xs & reverse & take 3

main :: IO ()
main = do
    -- 実行してみるよ
    print (myFunc [1 .. 10])
    print (myFunc2 [1 .. 10])

    -- 前回やった関数の結合
    (print . take 3 . reverse . filter even) [1 .. 10]

    -- かっこは$で省略できる これを関数適用という
    print . take 3 . reverse . filter even $ [1 .. 10]

    -- 一見、「.」と同じような書き方になるけど、
    -- \$は()を省略しているだけ
    -- だから、対象が用意されていないとエラーになる
    -- これはOK
    print $
        take 3 $
            reverse $
                filter even $
                    [1 .. 10]

    -- 「&」は関数呼び出しの順序を逆にする（一般的なプログラミングと同じ順番）
    -- これも厳密には関数の結合ではない
    -- 使用するためにはimport Data.Function ((&))が必要
    print $ [1 .. 10] & filter even & reverse & take 3
