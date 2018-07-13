{-# OPTIONS_GHC -fno-warn-orphans #-}

module Flight.Units (showRadian) where

import Data.UnitsOfMeasure (u, convert, fromRational')
import Data.UnitsOfMeasure.Internal (Quantity(..))
import Data.Bifunctor.Flip (Flip(..))
import Data.Ratio.Rounding (dpRound)

import Flight.Units.Angle ()

[u| m |]
[u| km = 1000 m |]

instance Functor (Flip Quantity u) where
    fmap = map'

map' :: (a -> b) -> Flip Quantity u a -> Flip Quantity u b
map' f (Flip (MkQuantity x)) = Flip $ MkQuantity $ f x

showRadian :: Quantity Rational [u| rad |] -> String
showRadian b = show dbl
    where
        deg = convert b :: Quantity Rational [u| deg |]
        Flip rounded = dpRound 3 <$> Flip deg
        MkQuantity dbl = fromRational' rounded :: Quantity Double [u| deg |]
