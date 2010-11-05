inorder :: BinTree a -> [a]
inorder t
    | isExternal t = []
    | otherwise    = inorder (left t) ++ [value t] ++ inorder (right t)
