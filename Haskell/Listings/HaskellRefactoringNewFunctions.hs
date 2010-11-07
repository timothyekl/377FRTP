isInternal (IntNode a) = True
isInternal _           = False

isExternal (ExtNode) = True
isExternal _         = False

value      (IntNode v _ _) = v
left       (IntNode _ l _) = l
right      (IntNode _ _ r) = r

-- Simply delegate to the current constructors
internalNode = IntNode
externalNode = ExtNode
