{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE StandaloneDeriving #-}

module Config.BoardConfig where

import           Control.Monad        (mzero)
import           Data.Aeson           (FromJSON, Value (String), eitherDecode,
                                       parseJSON)
import qualified Data.ByteString.Lazy as B
import           GHC.Generics

import           Data.Entity.Orientation          (Orientation (..))
import           Data.Entity.Fruit    (Fruit (..))
import           Data.Entity.Ghost    (State (..))
import           Data.World.Board     (Board, fromLists, fromString)
import           Paths_HacMan

data BoardConfig = BoardConfig
  { pacManConfig        :: PacManConfig
  , levelConfig         :: LevelConfig
  , stateDurationConfig :: StateDurationConfig
  } deriving (Show, Generic)

data PacManConfig = PacManConfig
  { x     :: Float
  , y     :: Float
  , lives :: Int
  , start :: Orientation
  } deriving (Show, Generic)

type LevelConfig = [Level]

data Level = Level
  { level      :: Int
  , fruit      :: Fruit
  , vulnerable :: Int
  , warning    :: Int
  } deriving (Show, Generic)

type StateDurationConfig = [DurationConfig]

data DurationConfig = DurationConfig
  { from    :: Int
  , to      :: Int
  , changes :: [Change]
  } deriving (Show, Generic)

data Change = Change
  { state    :: State
  , duration :: Int
  } deriving (Show, Generic)

deriving instance Generic Fruit

deriving instance Generic State

deriving instance Generic Orientation

instance FromJSON BoardConfig

instance FromJSON PacManConfig

instance FromJSON Level

instance FromJSON DurationConfig

instance FromJSON Change

instance FromJSON State where
  parseJSON (String "Chase")      = return Chase
  parseJSON (String "Scatter")    = return Scatter
  parseJSON (String "Frightened") = return Frightened
  parseJSON _                     = mzero

instance FromJSON Fruit where
  parseJSON (String "Cherry")     = return Cherry
  parseJSON (String "Strawberry") = return Strawberry
  parseJSON (String "Orange")     = return Orange
  parseJSON (String "Apple")      = return Apple
  parseJSON (String "Melon")      = return Melon
  parseJSON (String "Galaxian")   = return Galaxian
  parseJSON (String "Bell")       = return Bell
  parseJSON (String "Key")        = return Key
  parseJSON _                     = mzero

instance FromJSON Orientation where
  parseJSON (String "North") = return North
  parseJSON (String "East")  = return East
  parseJSON (String "South") = return South
  parseJSON (String "West")  = return West
  parseJSON _                = mzero

readBoard :: IO Board
readBoard = do
  path <- getDataFileName "config/classic.pacman"
  contents <- readFile path
  return . fromLists $ (map fromString <$> lines contents)

readEntities :: IO (StaticEntities, DynamicEntities)

readBoardConfig :: IO BoardConfig
readBoardConfig = do
  path <- getDataFileName "config/classic.pacman.config.json"
  d <- eitherDecode <$> B.readFile path
  case d of
    Left err -> error err
    Right b  -> return b
