module Config.Configuration where

import           Data.Char       (isAlphaNum)
import           Data.List       (elemIndex)
import qualified Data.Map.Strict as M
import           Data.Maybe      (catMaybes)

type Config = M.Map String String

getProperty :: Config -> String -> Maybe String
getProperty = flip M.lookup

getData :: Read a => Config -> String -> Maybe a
getData c s = read <$> getProperty c s

getData' :: Read a => Config -> String -> a -> a
getData' c s x =
  case getData c s of
    (Just y) -> y
    Nothing  -> x

readConfig :: FilePath -> IO Config
readConfig path = do
  file <- readFile path
  return . M.fromList . catMaybes $ splitProperty <$> lines file

splitProperty :: String -> Maybe (String, String)
splitProperty s = fmap (\(a, b) -> (filter isAlphaNum a, tail b)) $ flip splitAt s <$> '=' `elemIndex` s
