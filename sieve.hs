sieve :: Integral a => [a] -> [a]
sieve [] = []
sieve (n:ns) = n : sieve [m | m <- ns, m `mod` n /= 0]

main :: IO ()
main = print $ 2 : sieve [3,5..]
