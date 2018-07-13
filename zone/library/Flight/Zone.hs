{-# LANGUAGE AllowAmbiguousTypes #-}
module Flight.Zone where

import Data.UnitsOfMeasure (u)
import Data.UnitsOfMeasure.Internal (Quantity(..))

import Flight.Units ()

newtype Altitude a u = Altitude (Quantity a u)
deriving instance Show (Quantity a u) => Show (Altitude a u)

data Zone a where
    Line :: Altitude a [u| m |] -> Zone a

deriving instance Show (Altitude a u) => Show (Zone a)
-- /.../zone/library/Flight/Zone.hs:15:1: error:
--     • Overlapping instances for Show
--                                   (Altitude a (Data.UnitsOfMeasure.Internal.Base "m"))
--         arising from a use of ‘showsPrec’
--       Matching instances:
--         instance Show (Quantity a u) => Show (Altitude a u)
--           -- Defined at library/Flight/Zone.hs:10:1
--       There exists a (perhaps superclass) match:
--         from the context: Show (Altitude a u)
--           bound by the instance declaration at library/Flight/Zone.hs:15:1-54
--       (The choice depends on the instantiation of ‘a’
--        To pick the first instance above, use IncoherentInstances
--        when compiling the other instance declarations)
--     • In the second argument of ‘(.)’, namely ‘(showsPrec 11 b1)’
--       In the second argument of ‘showParen’, namely
--         ‘((.) (showString "Line ") (showsPrec 11 b1))’
--       In the expression:
--         showParen (a >= 11) ((.) (showString "Line ") (showsPrec 11 b1))
--       When typechecking the code for ‘showsPrec’
--         in a derived instance for ‘Show (Zone a)’:
--         To see the code I am typechecking, use -ddump-deriv
--    |
-- 15 | deriving instance Show (Altitude a u) => Show (Zone a)
--    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- 
-- /.../zone/library/Flight/Zone.hs:15:1: error:
--     • Overlapping instances for Show (Altitude a u0)
--         arising from a use of ‘GHC.Show.$dmshow’
--       Matching givens (or their superclasses):
--         Show (Altitude a u)
--           bound by the instance declaration at library/Flight/Zone.hs:15:1-54
--       Matching instances:
--         instance Show (Quantity a u) => Show (Altitude a u)
--           -- Defined at library/Flight/Zone.hs:10:1
--       (The choice depends on the instantiation of ‘a, u0’)
--     • In the expression: GHC.Show.$dmshow @Zone a
--       In an equation for ‘show’: show = GHC.Show.$dmshow @Zone a
--       When typechecking the code for ‘show’
--         in a derived instance for ‘Show (Zone a)’:
--         To see the code I am typechecking, use -ddump-deriv
--       In the instance declaration for ‘Show (Zone a)’
--    |
-- 15 | deriving instance Show (Altitude a u) => Show (Zone a)
--    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- 
-- /.../zone/library/Flight/Zone.hs:15:1: error:
--     • Overlapping instances for Show (Altitude a u1)
--         arising from a use of ‘showsPrec’
--       Matching givens (or their superclasses):
--         Show (Altitude a u)
--           bound by the instance declaration at library/Flight/Zone.hs:15:1-54
--       Matching instances:
--         instance Show (Quantity a u) => Show (Altitude a u)
--           -- Defined at library/Flight/Zone.hs:10:1
--       (The choice depends on the instantiation of ‘a, u1’)
--     • In the first argument of ‘GHC.Show.showList__’, namely
--         ‘(showsPrec 0)’
--       In the expression: GHC.Show.showList__ (showsPrec 0)
--       In an equation for ‘showList’:
--           showList = GHC.Show.showList__ (showsPrec 0)
--       When typechecking the code for ‘showList’
--         in a derived instance for ‘Show (Zone a)’:
--         To see the code I am typechecking, use -ddump-deriv
--    |
-- 15 | deriving instance Show (Altitude a u) => Show (Zone a)
--    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- 
