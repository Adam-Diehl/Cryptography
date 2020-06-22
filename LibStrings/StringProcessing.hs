{-
Author: Adam Diehl
Date-Created: 2020-06-19
Date-Revised: NA
Version: 0.1
Description: Module to handle strings passed by IO methods.
-}

module LibStrings.StringProcessing where

-- Imports
import Data.Char (ord, chr)

-- Push strings back and forth to integer arrays
stringToInt :: [Char] -> [Integer]
stringToInt input | length input == 0 = error "Input length is blank"
               | otherwise = map (toInteger . ord) input

-- Roll input in [0..25] up to ASCII Char.ord vals
intToString :: [Integer] -> [Char]
intToString input = map chr (map fromInteger (map (+97) input))

-- Roll the converted list down to [0..25]
reduceIntFromString :: [Integer] -> [Integer]
reduceIntFromString input = map ((-97) + ) input

-- Wrap the input handler and roll-down into one function for calling
processString :: [Char] -> [Integer]
processString input = reduceIntFromString (stringToInt input)
