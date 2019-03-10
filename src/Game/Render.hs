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
import           Data.World.Wall

render :: World -> IO Picture
render w = return $ renderWalls (view walls w)
--render = undefined -- TODO

display :: IO Display
display = do
  cfg <- config
  return $ InWindow (title cfg) (width cfg, height cfg) (posX cfg, posY cfg)

background :: Color
background = black

config :: IO WindowConfig
config = window <$> readGameConfig

renderWalls :: Walls -> Picture
renderWalls = Color blue . Pictures . map renderWall

renderWall :: Wall -> Picture
renderWall w = Line $ mapFunc [view (start . x), view (start . y), view (end . x), view (end . y)] w
  where mapFunc :: [Wall -> Int] -> Wall -> [(Float, Float)]
        mapFunc (x:y:ws) w = (fromIntegral . x $ w, fromIntegral . y $ w) : mapFunc ws w
        mapFunc [] _ = []
