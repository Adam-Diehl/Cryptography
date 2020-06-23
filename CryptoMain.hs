{-
Author: Adam Diehl
Date-Created: 2020-06-19
Date-Revised: 2020-06-22
Version: 0.2
Description: Main file to join the methods of the crypto library.
Compilation: ghc -o Crypto CryptoMain.hs -O2

Version notes
- Version 0.2: Created router to map encryption method
- Version 0.1: Minimally viable product, interactive CLI base
-}

-- Imports
import System.Environment
import EncryptionRouter

{- Set routings -}
-- Set default method
argParseEmpty :: IO()
argParseEmpty = do
  print("No valid encryption method specified")

-- Set routes
routeEncryption method
    | method == "Caesar" = argParseCaesar
    | otherwise = argParseEmpty

{- Enter main file -}
main :: IO()
main = do
  -- Get encryption method
  print("Provide encryption method (string):")
  method <- getLine

  -- Pass to router
  routeEncryption method
  
