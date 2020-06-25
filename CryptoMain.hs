{-
Author: Adam Diehl
Date-Created: 2020-06-19
Date-Revised: 2020-06-24
Version: 0.3
Description: Main file to join the methods of the crypto library.
Compilation: ghc -o Crypto CryptoMain.hs -O2

Version notes
- Version 0.4: Added support for decryption
- Version 0.3: Added basic unit testing. Moved empty route to EncryptionRouter.
- Version 0.2: Created router to map encryption method
- Version 0.1: Minimally viable product, interactive CLI base

---> Note about versioning: version numbers for other .hs files denote the
  version of *that file* and not of the project. Project versioning is linked to
  Mainfile versioning (this file). <---
-}

-- Imports
import System.Environment
import EncryptionRouter

-- Set routing
routeEncryption method
    | method == "Caesar" = argParseCaesar
    | otherwise = argParseEmpty

{- Enter main file -}
main :: IO()
main = do
  -- Get encryption method
  putStrLn("Provide encryption method (string):")
  method <- getLine

  -- Pass to router
  routeEncryption method
