-- A binary tree type
data BinTree a =
        ExtNode
      | IntNode a (BinTree a) (BinTree a)
