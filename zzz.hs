import Control.Applicative ()
import Control.Monad ()

half :: Integral a => a -> Maybe a
half x | even x = Just (x `div` 2)
       | otherwise = Nothing

twice :: Integral a => a -> a
twice x = x * 2

incr :: Integral a => a -> a
incr x = x + 1

foo :: [a -> b] -> (a -> [b])
foo [] = \ arg -> []
foo (fn:fns) = \ arg -> fn arg : foo fns arg

main :: IO ()
main = print $ foo [twice,incr,incr] 3
