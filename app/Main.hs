module Main
  ( main
  ) where

import           Graphics.Gloss.Interface.IO.Game (playIO)

import           Data.World
import qualified Game.Engine                      as Engine
import qualified Game.Reactive                    as Reactive
import qualified Game.Render                      as Render

main :: IO ()
main =
  playIO Render.display Render.background simulationResolution Engine.newWorld Render.render Reactive.handle Engine.tick

simulationResolution :: Int
simulationResolution = 20
