module Graph where

import Data.HashMap.Strict
import Data.Text


type PropName = Text
type PropValue = Text

-- | A node in a tree.
data Node = Node
  {
    children :: ![Node]
  , props    :: !(HashMap PropName PropValue)
  }


-- | @mostCommonInDescendents propName root@ finds the value of the
-- property named @propName@ most frequently found among the
-- descendents of @root@. If the property does not appear in the
-- descendents, returns Nothing. If multiple values are tied for most
-- frequent, return the 'minimum' among those values, by lexical sort
-- order.
mostCommonInDescendents :: PropName -> Node -> Maybe PropValue
mostCommonInDescendents = undefined


-- | @breadthFirstSearch propName propValue root@ finds the first
-- node, in breadth-first order, that contains a property named
-- @propName@ with value @propValue@. If no node matches, returns
-- Nothing.
breadthFirstSearch :: PropName -> PropValue -> Node -> Maybe Node
breadthFirstSearch = undefined




-- | A node that performs IO to get its children.
data NodeM = NodeM
  {
    childrenM :: !(IO [NodeM])
  , propsM    :: !(HashMap PropName PropValue)
  }


-- | @mostCommonInDescendentsM propName root@ is identical to `mostCommonInDescendents` except the lookup of children happens in IO.
mostCommonInDescendentsM :: PropName -> NodeM -> IO (Maybe PropValue)
mostCommonInDescendentsM = undefined


-- | @breadthFirstSearchM propName propValue root@ is identical to `breadthFirstSearch` except the lookup of children happens in IO.
breadthFirstSearchM :: PropName -> PropValue -> NodeM -> IO (Maybe NodeM)
breadthFirstSearchM = undefined
