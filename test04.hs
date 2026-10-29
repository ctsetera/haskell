multiply :: Int -> Int -> Int
multiply x y = x * y

main :: IO ()
main = do
    let somebodyScream = multiply 3
    print (somebodyScream 3)
