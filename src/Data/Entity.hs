module Data.Entity where

import           Data.Position

data Entity =
  Entity

type Entities = [Entity]

data Orientation
  = North
  | East
  | South
  | West
  deriving (Eq, Show)

class Positionable p where
  positionOf :: p -> Position

class Orientable p where
  orientationOf :: p -> Orientation
