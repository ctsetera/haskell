-- チャッピーに10年ぶりに競技プログラミングさせられました

{-次のリストを使って、
 -numbers = [1..20]
 -以下の処理を実装してみてほしい。
 -  1. 5の倍数だけを取り出す
 -  2. 取り出した値をそれぞれ2倍する
 -  3. 結果を print で表示する
 -期待する結果：
 -  [10,20,30,40]
 - -}

main :: IO ()
main = do
    let numbers = [1 .. 20]
    let tmp = filter (\x -> mod x 5 == 0) numbers
    let result = map (* 2) tmp
    print (result)
