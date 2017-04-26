import Control.Applicative ()
import Control.Monad ()

data Node = Node { lat :: Double, lon :: Double } deriving (Read, Show)
data Edge = Edge { from :: Node, to :: Node, cost :: Double } deriving (Read, Show)
type Graph = [Edge]

instance Eq Node
    where (Node y1 x1) == (Node y2 x2) = y1 == y2 && x1 == x2

instance Eq Edge
    where (Edge f1 t1 _) == (Edge f2 t2 _) = f1 == f2 && t1 == t2

norm :: Edge -> Double
norm (Edge f t _) = sqrt $ sum $ map m [map fn [f,t] | fn <- [lon,lat]]
    where m = \ [i,j] -> (i - j) ^ 2

anterograde :: Graph -> Node -> [Edge]
anterograde graph v = filter (\ (Edge f _ _) -> v == f) graph

retrograde :: Graph -> Node -> [Edge]
retrograde graph v = filter (\ (Edge _ t _) -> v == t) graph

main :: IO ()
main = print $ norm edge
 where from = Node 0 0 :: Node
       to = Node 3 4 :: Node
       edge = Edge from to 10 :: Edge
