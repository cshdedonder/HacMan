{-# LANGUAGE TupleSections #-}
module Game.Engine
  ( newWorld
  , tick
  , simulationRes
  ) where

import           Control.Lens

import           Config.GameConfig
import           Data.Position
import           Data.World
import           Paths_HacMan

newWorld :: IO World
newWorld = return undefined

simulationRes :: IO Int
simulationRes = simulationResolution <$> config

tick :: Float -> World -> IO World
tick _ = undefined

--tick = undefined -- TODO
config :: IO EngineConfig
config = engine <$> readGameConfig
