module Data.Entity where

type Position = (Int, Int)

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
