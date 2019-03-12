module Data.World.Board
  ( Board
  , Cell(..)
  , fromList
  , fromLists
  , fromString
  ) where

import           Data.Matrix

type Board = Matrix Cell

data Cell
  = Path
  | Wall
  | House
  | Empty
  | Entrance
  deriving (Show, Eq)

fromString :: Char -> Cell
fromString 'X' = Wall
fromString '.' = Path
fromString '+' = Path
fromString 'O' = Path
fromString 'A' = Path
fromString 'B' = Path
fromString 'C' = Path
fromString 'D' = Path
fromString '(' = Path
fromString ')' = Path
fromString '/' = Empty
fromString '$' = House
fromString '*' = Entrance
