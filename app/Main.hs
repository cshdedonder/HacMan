module Main
  ( main
  ) where

import           Graphics.Gloss.Interface.IO.Game (playIO)

import qualified Game.Engine                      as Engine
import qualified Game.Reactive                    as Reactive
import qualified Game.Render                      as Render

main :: IO ()
main = do
  initialWorld <- Engine.newWorld
  resolution <- Engine.simulationRes
  display <- Render.display
  playIO display Render.background resolution initialWorld Render.render Reactive.handle Engine.tick
