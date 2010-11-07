levelorder :: BinTree a -> [a]
levelorder (ExtNode) = []
levelorder (IntNode a left right) =
    a : (helper [left, right])
    where
        helper :: [BinTree a] -> [a]
        helper [] = []
        helper (ExtNode : queue) = helper queue
        helper ((IntNode a left right): queue) =
            a : helper (queue ++ [left, right])
