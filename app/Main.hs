module Main
  ( main
  ) where

import           Graphics.Gloss.Interface.IO.Game (playIO)

import qualified Game.Engine                      as Engine
import qualified Game.Reactive                    as Reactive
import qualified Game.Render                      as Render

main :: IO ()
main = do
  world <- Engine.newWorld
  res <- Engine.simulationRes
  playIO
    Render.display
    Render.background
    res
    world
    Render.render
    Reactive.handle
    Engine.tick
