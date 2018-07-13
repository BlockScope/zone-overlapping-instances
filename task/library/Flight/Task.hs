module Flight.Task where

import Data.UnitsOfMeasure (u)

import Flight.Zone (Altitude(..))

data StrictZone a where
    Line :: Eq a => Altitude a [u| m |] -> StrictZone a

deriving instance Eq (StrictZone a)

--     /.../task/library/Flight/Task.hs:33:19: error:
--         • Overlapping instances for Show (Altitude a u0)
--           Matching givens (or their superclasses):
--             Show (Altitude a u)
--               bound by an instance declaration:
--                          forall a (u :: Data.UnitsOfMeasure.Internal.Unit).
--                          Show (Altitude a u) =>
--                          Show (StrictZone a)
--               at library/Flight/Task.hs:33:19-60
--           Matching instances:
--             instance Show (Data.UnitsOfMeasure.Internal.Quantity a u) =>
--                      Show (Altitude a u)
--               -- Defined in ‘Flight.Zone’
--           (The choice depends on the instantiation of ‘a, u0’)
--         • In the ambiguity check for an instance declaration
--           To defer the ambiguity check to use sites, enable AllowAmbiguousTypes
--           In the stand-alone deriving instance for
--             ‘Show (Altitude a u) => Show (StrictZone a)’
--        |
--     33 | deriving instance Show (Altitude a u) => Show (StrictZone a)
--        |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
deriving instance Show (Altitude a u) => Show (StrictZone a)
