module Game.Engine
  ( newWorld
  , tick
  , simulationRes
  ) where

import qualified Config.GameConfig as Conf
import           Data.World
import           Paths_HacMan

newWorld :: IO World
newWorld = undefined -- TODO

simulationRes :: IO Int
simulationRes = do
  cfg <- config
  return $ Conf.simulationResolution . Conf.engine $ cfg

tick :: Float -> World -> IO World
tick = undefined -- TODO

config :: IO Conf.GameConfig
config = Conf.readGameConfig
