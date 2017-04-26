import System.Environment (getArgs)

factorizeR :: Integer -> [Integer] -> [Integer]
factorizeR n (x:xs) | n < x * x = [n]
 | mod n x == 0 = x:factorizeR (div n x) (x:xs)
 | otherwise = factorizeR n xs

rInt :: String -> Integer
rInt s = read s :: Integer

main :: IO ()
main = do
 args <- getArgs
 print $ factorizeR (rInt (head args)) (2:[3,5..])
