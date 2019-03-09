module Game.Render
  ( render
  , display
  , background
  ) where

import           Graphics.Gloss.Data.Picture

import           Data.World
import           Graphics.Gloss.Data.Color   (Color, black)
import           Graphics.Gloss.Data.Display (Display (InWindow))

render :: World -> IO Picture
render = undefined -- TODO

display :: Display
display = InWindow "HacMan - Pac-Man by Cedric S. H. De Donder" (800, 800) (100, 100)

background :: Color
background = black
