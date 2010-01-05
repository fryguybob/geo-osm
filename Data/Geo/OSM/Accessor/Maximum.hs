-- | Values with a @maximum@ string accessor.
module Data.Geo.OSM.Accessor.Maximum where

import Data.Geo.OSM.Accessor.Accessor
import Prelude hiding (maximum)

class Maximum a where
  maximum :: a -> String
  setMaximum :: String -> a -> a

  usingMaximum :: (String -> String) -> a -> a
  usingMaximum = maximum  `using` setMaximum
