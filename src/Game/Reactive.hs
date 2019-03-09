module Game.Reactive
  ( handle
  ) where

import           Graphics.Gloss.Interface.IO.Game (Event (EventKey), Key,
                                                   KeyState (Down))

import           Data.World

handle :: Event -> World -> IO World
handle (EventKey key Down _ _) = return . handleKeys key
handle _                       = return

handleKeys :: Key -> World -> World
handleKeys = undefined -- TODO
