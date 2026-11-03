-- パターンマッチの例①
describe :: Int -> String
describe 0 = "Zero"
describe 1 = "One"
describe _ = "Other"

-- パターンマッチの例②
firstOrZero :: [Int] -> Int
firstOrZero [] = 0
firstOrZero (x : xs) = x

-- 今回は fold も map も使わず、パターンマッチだけで書いてみよう。
-- 課題：リストの2番目の要素を返す関数 secondOrZero を実装する。
secondOrZero :: [Int] -> Int
secondOrZero (_ : y : _) = y
secondOrZero _ = 0

-- 課題：リストの要素数を数える myLength を実装する。
myLength :: [a] -> Int
myLength [] = 0
myLength (_ : xs) = myLength xs + 1

-- 課題：リストの最後の要素を返す lastOrZero を作る。
-- TLE: Time Limit Exceeded
-- もっと最適化できる
lastOrZero :: [Int] -> Int
lastOrZero [] = 0
lastOrZero (x : xs) = if myLength xs > 0 then lastOrZero xs else x

-- 課題：リストの最後の要素を返す lastOrZero を作る。
lastOrZero改 :: [Int] -> Int
lastOrZero改 [] = 0
lastOrZero改 [x] = x -- リスト内のアイテムが1だったら　(x : [])とも書ける
lastOrZero改 (_ : xs) = lastOrZero改 xs

main :: IO ()
main = do
    print $ describe 0
    print $ describe 1
    print $ describe 2

    putStrLn ""

    print $ firstOrZero []
    print $ firstOrZero [1 .. 5]

    putStrLn ""

    print $ secondOrZero []
    print $ secondOrZero [10]
    print $ secondOrZero [10, 20, 30, 40]

    putStrLn ""

    print $ myLength []
    print $ myLength [10]
    print $ myLength [10, 20, 30, 40]

    putStrLn ""

    print $ lastOrZero []
    print $ lastOrZero [10]
    print $ lastOrZero [10, 20, 30, 40]

    putStrLn ""

    print $ lastOrZero改 []
    print $ lastOrZero改 [10]
    print $ lastOrZero改 [10, 20, 30, 40]
