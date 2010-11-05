inorder :: BinTree a -> [a] -- <- type annotation
inorder (ExtNode) = []
inorder (IntNode b left right) =
    inorder left ++ [b] ++ inorder right
