module Data.Entity where

import           Config.BoardConfig
-- import           Data.Entity.Fruit
import           Data.Entity.Ghost
import           Data.Entity.Orientation
import           Data.Position

data StaticEntity
  = Pellet Position
  | PowerPellet Position
 -- | FruitEntity Fruit
 --               Position

data DynamicEntity
  = PacMan PacManConfig
           Position
  | GhostEntity GhostConfig
                Position

type StaticEntities = [StaticEntity]

type DynamicEntities = [DynamicEntity]

class Entity p where
  positionOf :: p -> Position

class Orientable p where
  orientationOf :: p -> Orientation

instance Entity StaticEntity where
  positionOf (Pellet p)        = p
  positionOf (PowerPellet p)   = p
 -- positionOf (FruitEntity _ p) = p

instance Entity DynamicEntity where
  positionOf (PacMan _ p)      = p
  positionOf (GhostEntity _ p) = p
