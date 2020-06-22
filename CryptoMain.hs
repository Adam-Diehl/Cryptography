{-
Author: Adam Diehl
Date-Created: 2020-06-19
Date-Revised: 2020-06-21
Version: 0.1
Description: Main file to join the methods of the crypto library.
Compilation: ghc -o Crypto CryptoMain.hs -O2

Version notes
- Version 0.1: minimally viable product, interactive CLI base

Planned upgrades
- Command line argument interface, with ability to choose encryption method
- Support for other encryption methods 
-}

-- Imports
import LibStrings.StringProcessing
import LibCiphers.Caesar
import System.Environment

-- Enter mainfile
main :: IO()
main = do

  -- Get plain text
  print("Enter the plain text...")
  message <- getLine
  let plainText = processString message

  -- Get encryption Key
  print("Enter the encryption key (as an integer)")
  key <- readLn :: IO Integer

  -- Encrypt
  let rawCipherText = encryptCaesar key plainText
  let cleanCipherText = intToString rawCipherText

  -- Print output
  print("Cipher text: " ++ cleanCipherText)
