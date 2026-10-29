-- Haskellの関数は、基本的に1つの引数を受け取る
-- 複数の引数を取るように見える関数も、
-- 実際には引数を1つ受け取り、次の関数を返す構造になっている
-- この仕組みをカリー化（Currying）と呼ぶ
add :: Int -> Int -> Int
add x y = x + y

main :: IO ()
main = do
    print (add 5 10)

    -- Haskellでは、すべての引数を一度に渡す必要はない
    -- addに最初の引数5を渡すと、
    -- 残りの引数を受け取る新しい関数が得られる
    -- この仕組みを部分適用（Partial Application）と呼ぶ
    let addFive = add 5
    print (addFive 10)
    print (addFive 15)
