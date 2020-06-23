{-
Author: Adam Diehl
Date-Created: 2020-06-22
Date-Revised: 2020-06-22
Version: 0.1
Description: File contains functions to route user input to the appropriate set
  of encryption functions
-}

module EncryptionRouter where

{- Global imports -}
import LibStrings.StringProcessing

{- ROUTE: Caesar shift cipher -}
import LibCiphers.Caesar

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