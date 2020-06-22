{-
Author: Adam Diehl
Date-Created: 2020-06-19
Date-Revised: 2020-06-21
Version: 0.1
Description: Module to handle encrypting (forward mode) and decrypting
  (reverse mode) simple Caesar ciphers.

Version notes
- Version 0.1: minimally viable product, supports encryption
-}

module LibCiphers.Caesar where

-- Forward mode
{-
Takes as input:
--> Plaintext takes as input integers as handled by LibStrings.StringProcessing,
--> Encryption key takes as input an integer, treated as an offset value
    (so 1 = all values +1, mapping A->B, B->C, etc.), and
Returns as output:
--> More ints to be handled by LibStrings.StringProcessing
-}
caesarBase :: Integer -> Integer -> Integer
caesarBase key plainText = (plainText + key) `mod` 26

encryptCaesar :: Integer -> [Integer] -> [Integer]
encryptCaesar key plainText = map (caesarBase key) plainText
