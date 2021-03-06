{-# LANGUAGE TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses #-}

-- | The @tracepoints@ element of a OSM file.
module Data.Geo.OSM.Tracepoints
(
  Tracepoints
, tracepoints
) where


import Text.XML.HXT.Arrow.Pickle
import Data.Geo.OSM.Lens.PerPageL
import Data.Lens.Common
import Control.Comonad.Trans.Store
import Control.Newtype

-- | The @tracepoints@ element of a OSM file.
newtype Tracepoints =
  Tracepoints String
  deriving Eq

-- | Constructs a @tracepoints@ with per_page.
tracepoints ::
  String -- ^ The @per_page@ attribute.
  -> Tracepoints
tracepoints =
  Tracepoints

instance XmlPickler Tracepoints where
  xpickle =
    xpElem "tracepoints" (xpWrap (tracepoints, \(Tracepoints r) -> r) (xpAttr "per_page" xpText))

instance Show Tracepoints where
  show =
    showPickled []

instance PerPageL Tracepoints where
  perPageL =
    Lens $ \(Tracepoints perPage) -> store (\perPage -> Tracepoints perPage) perPage

instance Newtype Tracepoints String where
  pack = 
    Tracepoints
  unpack (Tracepoints x) =
    x

