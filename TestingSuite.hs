{-
Author: Adam Diehl
Date-Created: 2020-06-24
Date-Revised: NA
Version: 0.1
Description: Set of unit tests
Usage notes: run through ghci >> runTestTT unitTests (or appropriate subgroup)

Version notes
- Version 0.1: Minimally viable product
-}

{- Imports -}
import Test.HUnit
import Tests.UnitTests_Ciphers

{- Link tests -}
unitTests =
  TestList [TestLabel "Tests :: Ciphers : Caesar" unitTests_Caesar]
