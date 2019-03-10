{-# LANGUAGE TemplateHaskell #-}

module Data.World.Wall where

import Control.Lens

import           Data.Position

data Wall = Wall
  { _start :: Position
  , _end   :: Position
  }

type Walls = [Wall]

makeLenses ''Wall