module Data.Entity.Ghost where

data State = Scatter | Chase | Frightened deriving (Eq, Show, Read)

data GhostConfig