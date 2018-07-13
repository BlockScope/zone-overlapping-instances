module Flight.Task where

import Data.UnitsOfMeasure (u, zero)

import Flight.Zone (Altitude(..))

data Goal deriving AnyZone
class AnyZone a where

data Zone k a where
    Line :: Eq a => Altitude a [u| m |] -> Zone Goal a

deriving instance Eq (Zone k a)

-- /.../task/library/Flight/Task.hs:31:19: error:
--    • Could not deduce (Show (Altitude a u0))
--       from the context: Show (Altitude a u)
--         bound by an instance declaration:
--                    forall a (u :: Data.UnitsOfMeasure.Internal.Unit) k.
--                    Show (Altitude a u) =>
--                    Show (Zone k a)
--         at /.../task/library/Flight/Task.hs:14:19-56
--       The type variable ‘u0’ is ambiguous
--     • In the ambiguity check for an instance declaration
--       To defer the ambiguity check to use sites, enable AllowAmbiguousTypes
--       In the stand-alone deriving instance for
--         ‘Show (Altitude a u) => Show (Zone k a)’
--    |
-- 31 | deriving instance Show (Altitude a u) => Show (Zone k a)
--    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
deriving instance Show (Altitude a u) => Show (Zone k a)
