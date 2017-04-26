import System.Environment (getArgs)

isPrimeR :: Int -> [Int] -> Bool
isPrimeR n (x:xs) | n < x * x = True
                  | mod n x == 0 = False
                  | otherwise = isPrimeR n xs

appendIfPrimeR :: [Int] -> Int -> [Int] -> [Int]
appendIfPrimeR ns n xs | isPrimeR n xs = ns ++ [n]
                       | otherwise = ns

bind3rd :: (a -> b -> c -> d) -> c -> (a -> b -> d)
bind3rd fn arg3 = \ arg1 arg2 -> fn arg1 arg2 arg3

pc0 :: Int -> [Int]
pc0 0 = [2]
pc0 1 = [2,3]
pc0 x = f c 1
 where c = pc0 (x - 1) :: [Int]
       d = drop 1 c :: [Int]
       e = bind3rd appendIfPrimeR d :: [Int] -> Int -> [Int]
       f = \ arg i -> e arg (x * 2 + i)

pc1 :: Int -> [Int]
pc1 0 = [2,3,5]
pc1 x = f (f c 1) 5
 where c = pc1 (x - 1) :: [Int]
       d = drop 2 c :: [Int]
       e = bind3rd appendIfPrimeR d :: [Int] -> Int -> [Int]
       f = \ arg i -> e arg (x * 6 + i)

pc2 :: Int -> [Int]
pc2 0 = [2,3,5,7,11,13,17,19,23,29]
pc2 x = f (f (f (f (f (f (f (f c 1) 7) 11) 13) 17) 19) 23) 29
 where c = pc2 (x - 1) :: [Int]
       d = drop 3 c :: [Int]
       e = bind3rd appendIfPrimeR d :: [Int] -> Int -> [Int]
       f = \ arg i -> e arg (x * 30 + i)

rInt :: String -> Int
rInt s = read s :: Int

main :: IO ()
main = do
 args <- getArgs
 print $ pc2 (rInt (head args))
