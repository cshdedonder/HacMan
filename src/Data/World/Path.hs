{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections   #-}

module Data.World.Path where

import           Control.Lens
import           Data.HashMap            hiding (map)

import           Data.Position
import           Data.World.Intersection

data Path = Path
  { _intersections :: (Intersection, Intersection)
  , _pathCells     :: [Position]
  }

type Paths = [Path]

makeLenses ''Path

positionMap :: Paths -> Map Position Path
positionMap = fromList . concatMap (\p -> map (, p) $ view pathCells p)
