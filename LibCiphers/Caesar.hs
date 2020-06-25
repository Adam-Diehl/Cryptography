{-
Author: Adam Diehl
Date-Created: 2020-06-19
Date-Revised: 2020-06-22
Version: 0.2
Description: Module to handle encrypting (forward mode) and decrypting
  (reverse mode) simple Caesar ciphers.
-}

module LibCiphers.Caesar where

{- Forward mode -}
-- Base shifts integer (rep. a letter) by offset, and mods down to ASCII
caesarBase :: Integer -> Integer -> Integer
caesarBase key plainText = (plainText + key) `mod` 26

-- Encrypt wraps Base for around a list passed by LibString
encryptCaesar :: Integer -> [Integer] -> [Integer]
encryptCaesar key plainText = map (caesarBase key) plainText

{- Reverse mode -}
-- Get list of all 26 possible plain texts
bruteForceDecryptCaesar :: [Integer] -> [[Integer]]
bruteForceDecryptCaesar cipherText = map (\possibleKeys -> encryptCaesar possibleKeys cipherText) [0..25]
