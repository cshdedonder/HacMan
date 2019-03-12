module Game.ConfigTest where

import           Test.HUnit

import           Data.Matrix       (prettyMatrix, (!))

import           Config.BoardConfig (readBoard, readBoardConfig, pacManConfig, lives)
import           Data.World.Board  (Cell (Wall))

test1 :: Test
test1 =
  TestCase $ do
    n <- readBoard
    assertEqual "Test Board" (n ! (1, 1)) Wall

test2 :: Test
test2 = TestCase $ do
  cfg <- readBoardConfig
  assertEqual "Test Board Data" (lives . pacManConfig $ cfg) 3


tests :: Test
tests = TestList [TestLabel "testReadBoard" test1, TestLabel "testReadBoardConfig" test2]
