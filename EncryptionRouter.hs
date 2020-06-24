{-
Author: Adam Diehl
Date-Created: 2020-06-22
Date-Revised: 2020-06-22
Version: 0.2
Description: File contains functions to route user input to the appropriate set
  of encryption functions.

Version notes
- Version 0.2: Moved empty route into this file.
- Version 0.1: Minimally viable product
-}

module EncryptionRouter where

{- Imports -}
import LibStrings.StringProcessing
import LibCiphers.Caesar

{- Set Routes -}
-- ROUTE: Empty/Null/Default
argParseEmpty :: IO()
argParseEmpty = do
  print("No valid encryption method specified")

-- ROUTE: Caesar shift cipher
argParseCaesar :: IO()
argParseCaesar = do
  -- Get plain text
  print("Provide the plain text (string):")
  message <- getLine
  let plainText = processString message

  -- Get encryption Key
  print("Provide the encryption key (integer):")
  key <- readLn :: IO Integer

  -- Encrypt
  let rawCipherText = encryptCaesar key plainText
  let cleanCipherText = intToString rawCipherText

  -- Print output
  print("Cipher text: " ++ cleanCipherText)
