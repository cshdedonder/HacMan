{-# LANGUAGE TemplateHaskell #-}

module Data.World where

import           Control.Lens
import           Data.Map.Strict hiding (map)

import           Data.Entity
import           Data.Position
import           Data.World.Board

data World = World
  { _board :: Board
  , _staticEntities :: StaticEntities
  , _dynamicEntities :: DynamicEntities
  }

makeLenses ''World

