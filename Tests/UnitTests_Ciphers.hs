{-
Author: Adam Diehl
Date-Created: 2020-06-24
Date-Revised: NA
Version: 0.1
Description: Set of unit tests for the cipher libraries

Version notes
- Version 0.1: Minimally viable product
-}

module Tests.UnitTests_Ciphers where

{- Imports -}
import Test.HUnit
import LibCiphers.Caesar

{- Caesar shift cipher -}
unitTests_Caesar =
  TestList [TestLabel "Accuracy test: caesarBase" testAccuracyOfCaesarBase,
    TestLabel "Accuracy test: encryptCaesar" testAccuracyOfEncryptCaesar]

testAccuracyOfCaesarBase =
  TestCase (assertEqual "Testing caesarBase 20 + 15 == 10" 9 (caesarBase 15 20))

testAccuracyOfEncryptCaesar =
  TestCase (assertEqual "Testing encryptCaesar with +3 offset" ([3..25] ++ [0..2]) (encryptCaesar 3 [0..25]))
