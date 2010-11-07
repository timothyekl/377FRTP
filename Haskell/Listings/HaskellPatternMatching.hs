-- Return a list of the values in the tree inorder
inorder (ExtNode) = []
inorder (IntNode b left right) =
    inorder left ++ [b] ++ inorder right
