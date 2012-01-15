-- | Values with a @type@ accessor.
module Data.Geo.OSM.Accessor.Mtype where

import Data.Geo.OSM.MemberType
import Data.Geo.OSM.Accessor.Accessor

class Mtype a where
  mtype :: a -> MemberType
  setMtype :: MemberType -> a -> a

  usingMtype :: (MemberType -> MemberType) -> a -> a
  usingMtype = mtype `using` setMtype