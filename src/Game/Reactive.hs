module Game.Reactive
  ( handle
  ) where

import           Graphics.Gloss.Interface.IO.Game (Event (EventKey), Key,
                                                   KeyState (Down))

import           Data.World

handle :: Event -> World -> IO World
handle (EventKey x Down _ _) = return . handleKeys x
handle _                     = return

handleKeys :: Key -> World -> World
handleKeys = undefined
