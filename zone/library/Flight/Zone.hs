module Flight.Zone where

import Data.UnitsOfMeasure (u, convert, fromRational', toRational')
import Data.UnitsOfMeasure.Internal (Quantity(..))
import Data.UnitsOfMeasure.Convert (Convertible)

import Flight.Units (showRadian)
import Flight.Distance (TaskDistance(..))

newtype Altitude a u = Altitude (Quantity a u) deriving (Eq, Ord)
 
instance Show (Quantity a u) => Show (Altitude a u) where
    show (Altitude a) = "a = " ++ show a

data Zone a where
    Line :: Eq a => Altitude a [u| m |] -> Zone a

deriving instance Eq (Zone a)
deriving instance Show (Altitude a [u| m |]) => Show (Zone a)
