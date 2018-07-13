module Flight.Zone where

import Data.UnitsOfMeasure (u, convert, fromRational', toRational')
import Data.UnitsOfMeasure.Internal (Quantity(..))
import Data.UnitsOfMeasure.Convert (Convertible)

import Flight.Units (showRadian)
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

newtype Incline a = Incline (Quantity a [u| rad |]) deriving (Eq, Ord)
newtype Bearing a = Bearing (Quantity a [u| rad |]) deriving (Eq, Ord)

instance Show (Quantity a u) => Show (Altitude a u) where
    show (Altitude a) = "a = " ++ show a

instance Real a => Show (Incline a) where
    show (Incline i) = "i = " ++ showRadian (toRational' i)

instance Real a => Show (Bearing a) where
    show (Bearing b) = "r = " ++ showRadian (toRational' b)

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
