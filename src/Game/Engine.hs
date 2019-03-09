module Game.Engine (newWorld, tick,simulationRes) where

import Data.World
import Config.Configuration (Config, readConfig, getData')

newWorld :: IO World
newWorld = undefined -- TODO

simulationRes :: IO Int
simulationRes = do
  cfg <- config
  return $ getData' cfg "simulation.resolution" 20

tick :: Float -> World -> IO World
tick = undefined -- TODO

config :: IO Config
config = readConfig "engine.config"