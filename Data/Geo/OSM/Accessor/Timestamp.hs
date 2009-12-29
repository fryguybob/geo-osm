-- | Values with a @timestamp@ optional string accessor.
module Data.Geo.OSM.Accessor.Timestamp where

class Timestamp a where
  timestamp :: a -> Maybe String