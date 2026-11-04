-- Listを自分で定義してみる
data MyList a -- a 型の要素を格納できる MyList という型を定義する
-- Nil・Cons a (MyList a)は、MyList a の値には 2種類の形があるという意味 これらを「データコンストラクタ」と呼ぶ
    = Nil -- 空のリスト
    | Cons a (MyList a) -- 先頭の要素と、残りのリスト
    deriving (Show) -- 作った値を print などで表示できるようにするための指定

-- MyList の先頭の要素を返す関数 myHead を実装してみよう。
myHead :: MyList Int -> Int
myHead Nil = 0
myHead (Cons x _) = x

-- MyList の先頭に要素を追加する関数を作ってみよう。
myPrepend :: a -> MyList a -> MyList a
myPrepend value (Cons x xs) = Cons value (Cons x xs)

-- MyList の先頭に要素を追加する関数を作ってみよう。
myPrepend改 :: a -> MyList a -> MyList a
myPrepend改 = Cons

-- 次の課題：自作リストの末尾に追加する
myAppend :: a -> MyList a -> MyList a
myAppend value Nil = Cons value Nil
myAppend value (Cons x xs) = Cons x (myAppend value xs)

-- 次の課題：自作リストを標準リストに変換する
toList :: MyList a -> [a]
toList Nil = []
toList (Cons x xs) = x : toList xs

main :: IO ()
main = do
    let list = Cons 30 (Cons 20 (Cons 10 Nil))
    print $ list

    putStrLn ""

    print $ myHead $ Nil
    print $ myHead $ Cons 30 $ Cons 20 $ Cons 10 Nil

    putStrLn ""

    print $ myPrepend 10 (Cons 20 Nil)
    print $ myPrepend 40 $ Cons 30 $ Cons 20 $ Cons 10 Nil

    putStrLn ""

    print $ myPrepend改 10 (Cons 20 Nil)
    print $ myPrepend改 40 $ Cons 30 $ Cons 20 $ Cons 10 Nil

    putStrLn ""

    print $ myAppend 10 (Cons 20 Nil)
    print $ myAppend 40 $ Cons 30 $ Cons 20 $ Cons 10 Nil

    putStrLn ""

    print $ toList (Nil :: MyList Int)
    print $ toList $ Cons 10 Nil
    print $ toList $ Cons 10 $ Cons 20 $ Cons 30 Nil
