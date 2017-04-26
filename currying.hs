foo :: Num a => a -> a -> a
foo x y = (x * 2) + y
bar :: Integer -> Integer
bar = foo 3
main :: IO ()
main = print $ bar 11

--foo c [] = []
--foo c (x:xs) = (c * x):foo c xs
--main = print $ foo 3 [1, 2, 3]
