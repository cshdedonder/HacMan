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
import           Data.World.Wall
import           Paths_HacMan

newWorld :: IO World
newWorld = return $ World [Wall (position (200, 200)) (position (500, 500))] [] []

simulationRes :: IO Int
simulationRes = simulationResolution <$> config

tick :: Float -> World -> IO World
tick _ = return . over walls (map (over (start . y) (+ (-3)) . over (start . x) (+ (-3))))

--tick = undefined -- TODO
config :: IO EngineConfig
config = engine <$> readGameConfig
