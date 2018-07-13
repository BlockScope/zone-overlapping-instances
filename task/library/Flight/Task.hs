module Flight.Task where

import Data.UnitsOfMeasure (u, zero)

import Flight.Zone (Altitude(..), Radius(..))

data Goal deriving AnyZone
class AnyZone a where

data Zone k a where
    Line
        :: Eq a
        => Altitude a [u| m |]
        -> Radius a [u| m |]
        -> Zone Goal a

deriving instance Eq (Zone k a)

--     /.../task/library/Flight/Task.hs:44:5: error:
--         • Overlapping instances for Show (Altitude a u0)
--           Matching givens (or their superclasses):
--             Show (Altitude a u)
--               bound by an instance declaration:
--                          forall a (u :: Data.UnitsOfMeasure.Internal.Unit) k.
--                          (Show (Altitude a u),
--                           Show (Radius a (Data.UnitsOfMeasure.Internal.MkUnit "m"))) =>
--                          Show (Zone k a)
--               at library/Flight/Task.hs:(36,5)-(39,22)
--           Matching instances:
--             instance Show (Data.UnitsOfMeasure.Internal.Quantity a u) =>
--                      Show (Altitude a u)
--               -- Defined in ‘Flight.Zone’
--           (The choice depends on the instantiation of ‘a, u0’)
--         • In the ambiguity check for an instance declaration
--           To defer the ambiguity check to use sites, enable AllowAmbiguousTypes
--           In the stand-alone deriving instance for
--             ‘(Show (Altitude a u),
--               Show (Radius a (Data.UnitsOfMeasure.Internal.MkUnit "m"))) =>
--              Show (Zone k a)’
--        |
--     44 |     ( Show (Altitude a u)
--        |     ^^^^^^^^^^^^^^^^^^^^^...             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
deriving instance
    ( Show (Altitude a u)
    , Show (Radius a [u| m |])
    )
    => Show (Zone k a)
