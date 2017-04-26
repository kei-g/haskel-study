import System.Environment (getArgs)

sieve :: Integral a => [a] -> [a]
sieve [] = []
sieve (n:ns) = n : sieve [m | m <- ns, m `mod` n /= 0]

isPrimeR :: Integral a => a -> [a] -> Bool
isPrimeR n (x:xs) | n < x * x = True
                  | mod n x == 0 = False
                  | otherwise = isPrimeR n xs

appendIfPrimeR :: Integral a => [a] -> a -> [a] -> [a]
appendIfPrimeR ns n xs | isPrimeR n xs = ns ++ [n]
                       | otherwise = ns

bind3rd :: (a -> b -> c -> d) -> c -> (a -> b -> d)
bind3rd fn arg3 = \ arg1 arg2 -> fn arg1 arg2 arg3

foo :: ([a] -> a -> [a]) -> [a] -> ([a] -> a -> [a])
foo fn [] = fn
foo fn xs = \ arg1 arg2 -> fn (fx arg1 arg2) (last xs)
 where fx = foo fn (init xs)

pc2 :: Int -> [Int]
pc2 0 = 2 : takeWhile (\ x -> x < 30) (sieve [3,5..])
pc2 x = g c 1
 where a = pc2 0 :: [Int]
       b = drop 3 a :: [Int]
       c = pc2 (x - 1) :: [Int]
       d = drop 3 c :: [Int]
       e = bind3rd appendIfPrimeR d :: [Int] -> Int -> [Int]
       f = \ arg i -> e arg (x * 30 + i)
       g = foo f b

rInt :: String -> Int
rInt s = read s :: Int

main :: IO ()
main = do
 args <- getArgs
 print $ pc2 $ rInt $ head args
