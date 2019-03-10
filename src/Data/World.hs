{-# LANGUAGE TemplateHaskell #-}

module Data.World where

import           Control.Lens
import           Data.Map.Strict hiding (map)

import           Data.Entity
import           Data.Position
import           Data.World.Path
import           Data.World.Wall

data World = World
  { _walls    :: Walls
  , _entities :: Entities
  , _paths    :: Paths
  }

makeLenses ''World

