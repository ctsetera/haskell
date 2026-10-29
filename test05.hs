main :: IO ()
main = do
    print (filter (\x -> x `mod` 2 == 0) [1, 2, 3, 4, 5, 6])
