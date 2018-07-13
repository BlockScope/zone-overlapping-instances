module Flight.Zone where

import Data.UnitsOfMeasure (u, convert, fromRational', toRational')
import Data.UnitsOfMeasure.Internal (Quantity(..))
import Data.UnitsOfMeasure.Convert (Convertible)

import Flight.Units ()
import Flight.Distance (TaskDistance(..))

newtype Altitude a u = Altitude (Quantity a u) deriving (Eq, Ord)
newtype Radius a u = Radius (Quantity a u) deriving (Eq, Ord)
 
instance
    ( Real a
    , Fractional a
    , Show a
    , Convertible u [u| m |]
    )
    => Show (Radius a u) where
    show (Radius q) = show . TaskDistance . convert $ q

data Zone a where
    Line
        :: Eq a
        => Altitude a [u| m |]
        -> Radius a [u| m |]
        -> Zone a

deriving instance Eq (Zone a)
deriving instance
    ( Show (Altitude a [u| m |])
    , Show (Radius a [u| m |])
    )
    => Show (Zone a)
