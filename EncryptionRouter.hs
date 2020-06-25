{-
Author: Adam Diehl
Date-Created: 2020-06-22
Date-Revised: 2020-06-24
Version: 0.2
Description: File contains functions to route user input to the appropriate set
  of encryption functions.

Version notes
- Version 0.3: Added support for decryption
- Version 0.2: Moved empty route into this file.
- Version 0.1: Minimally viable product
-}

module EncryptionRouter where

{- Imports -}
import LibStrings.StringProcessing
import LibCiphers.Caesar

{- Set Routes -}
--------------------------------------------------------------------------------

-- ROUTE: Empty/Null/Default
argParseEmpty :: IO()
argParseEmpty = do
  print("No valid encryption method specified")

--------------------------------------------------------------------------------

-- ROUTE: Caesar
argParseCaesar :: IO()
argParseCaesar = do
  -- Select mode
  putStrLn("Choose mode: encrypt/decrypt (string): ")
  mode <- getLine

  -- Pass to subrouter
  subrouteCaeser mode

-- Define subrouter
subrouteCaeser mode
  | mode == "encrypt" = caesarForward
  | mode == "decrypt" = caesarBackward
  | otherwise = putStrLn("Error: mode invalid -> choose 'encrypt' or 'decrypt': ")

  {- (Sub)route paths -}
  -- FORWARD: encrypt plain text
caesarForward :: IO()
caesarForward = do
  -- Get plain text
  putStrLn("Provide the plain text (string): ")
  message <- getLine
  let plainText = processString message

  -- Get encryption Key
  putStrLn("Provide the encryption key (integer): ")
  key <- readLn :: IO Integer

  -- Encrypt
  let rawCipherText = encryptCaesar key plainText
  let cleanCipherText = intToString rawCipherText

  -- Print output
  putStrLn("Cipher text: " ++ cleanCipherText)

-- BACKWARD: decrypt through brute force
caesarBackward :: IO()
caesarBackward = do
  -- Get cipher text
  putStrLn("Provide the cipher text (string): ")
  message <- getLine
  let cipherText = processString message

  -- Brute force the possible encryption keys
  let rawPlainTextPossibles = bruteForceDecryptCaesar cipherText

  -- Convert back to human-readable strings
  let cleanPlainTextPossibles = map intToString rawPlainTextPossibles

  -- Print out the options
  putStrLn("Generating possible plaintexts: ")
  mapM_ putStrLn (zipWith (++) (take 26 (repeat ">>> ")) cleanPlainTextPossibles)

--------------------------------------------------------------------------------
