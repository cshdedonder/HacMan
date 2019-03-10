import qualified Game.EngineTest as EngineTest

import Test.HUnit

main :: IO ()
main = do
  _ <- runTestTT EngineTest.tests
  return ()
