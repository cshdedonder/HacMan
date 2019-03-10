module Game.EngineTest where

import Test.HUnit

import Game.Engine (simulationRes)

test1 :: Test
test1 = TestCase $ do
  n <- simulationRes
  assertEqual "Read in config" 20 n

tests :: Test
tests = TestList [TestLabel "testReadIn" test1]

