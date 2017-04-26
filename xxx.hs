isPrime :: Integral t => t -> [t] -> Bool
isPrime n (x:xs)
 | n < x * x = True
 | mod n x == 0 = False
 | otherwise = isPrime n xs

main :: IO ()
main = print $ take 30 [x | x <- (2:[3,5..]), isPrime x (2:[3,5..])]
