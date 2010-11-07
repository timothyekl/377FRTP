module BinTree
    (
      BinTree
    , ExtNode
    , IntNode
    , inorder
    , levelorder
    ) where

data BinTree a =
      ExtNode
    | IntNode a (BinTree a) (BinTree a)

inorder :: BinTree a -> [a]
inorder (ExtNode) = []
inorder (IntNode a left right) =
    inorder left ++ [a] ++ inorder right

levelorder :: BinTree a -> [a]
levelorder (ExtNode) = []
levelorder (IntNode a left right) =
    a : (loHelper [left, right])

loHelper :: [BinTree a] -> [a]
loHelper [] = []
loHelper (ExtNode : queue) = loHelper queue
loHelper ((IntNode a left right): queue) =
    a : loHelper (queue ++ [left, right])
