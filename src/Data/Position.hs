{-# LANGUAGE DeriveGeneric   #-}
{-# LANGUAGE TemplateHaskell #-}

module Data.Position where

import           Control.Lens
import           Data.Hashable
import           GHC.Generics  (Generic)

data Position = Position
  { _x :: Int
  , _y :: Int
  } deriving (Eq, Generic, Show)

instance Hashable Position

instance Ord Position where
  Position x1 y1 <= Position x2 y2 = x1 <= x2 && y1 <= y2

makeLenses ''Position

position :: (Int, Int) -> Position
position = uncurry Position