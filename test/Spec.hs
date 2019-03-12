import qualified Game.EngineTest as EngineTest
import qualified Game.ConfigTest as ConfigTest

import Test.HUnit

main :: IO ()
main = do
  _ <- runTestTT EngineTest.tests
  _ <- runTestTT ConfigTest.tests
  return ()
