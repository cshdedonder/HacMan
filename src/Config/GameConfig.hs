{-# LANGUAGE OverloadedStrings #-}

module Config.GameConfig where

import Paths_HacMan
import Control.Applicative
import Data.Yaml

data GameConfig = GameConfig {
  engine :: EngineConfig,
  window :: WindowConfig
} deriving Show

data EngineConfig = EngineConfig {
  simulationResolution :: Int
} deriving Show

data WindowConfig = WindowConfig {
  width :: Int,
  height :: Int,
  posX :: Int,
  posY :: Int
} deriving Show

instance FromJSON GameConfig where
  parseJSON (Object m) = GameConfig <$>
    m .: "engine" <*>
    m .: "window"

instance FromJSON EngineConfig where
  parseJSON (Object m) = EngineConfig <$>
    m .: "simulationResolution"

instance FromJSON WindowConfig where
  parseJSON (Object m) = WindowConfig <$>
    m .: "width" <*>
    m .: "height" <*>
    m .: "posX" <*>
    m .: "posY"

readGameConfig :: IO GameConfig
readGameConfig = do
  path <- getDataFileName "config/gameconfig.yaml"
  either (error . show) id <$> decodeFileEither path