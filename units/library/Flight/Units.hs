{-# OPTIONS_GHC -fno-warn-orphans #-}

module Flight.Units where

import Data.UnitsOfMeasure (u)
import Data.UnitsOfMeasure.Internal (Quantity(..))
import Data.Bifunctor.Flip (Flip(..))

[u| m |]
[u| km = 1000 m |]

instance Functor (Flip Quantity u) where
    fmap = map'

map' :: (a -> b) -> Flip Quantity u a -> Flip Quantity u b
map' f (Flip (MkQuantity x)) = Flip $ MkQuantity $ f x
