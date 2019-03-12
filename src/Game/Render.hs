module Game.Render
  ( render
  , display
  , background
  ) where

import           Control.Lens
import           Graphics.Gloss.Data.Color   (Color, black, blue)
import           Graphics.Gloss.Data.Display (Display (InWindow))
import           Graphics.Gloss.Data.Picture

import           Config.GameConfig           (WindowConfig, height, posX, posY,
                                              readGameConfig, title, width,
                                              window)
import           Data.Position
import           Data.World

render :: World -> IO Picture
render w = undefined -- TODO

display :: IO Display
display = do
  cfg <- config
  return $ InWindow (title cfg) (width cfg, height cfg) (posX cfg, posY cfg)

background :: Color
background = black

config :: IO WindowConfig
config = window <$> readGameConfig