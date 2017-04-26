foo :: Num a => a -> [a] -> [a]
foo c [] = []
foo c (x:xs) = c * x : foo c xs

main :: IO ()
main = print $ foo 3 [1, 2, 3]
