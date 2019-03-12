module Data.Entity.Fruit where

data Fruit
  = Cherry
  | Strawberry
  | Orange
  | Apple
  | Melon
  | Galaxian
  | Bell
  | Key
  deriving (Eq, Show, Read)

scoreOf :: Fruit -> Int
scoreOf Cherry = 100
scoreOF _ = 0 -- TODO
