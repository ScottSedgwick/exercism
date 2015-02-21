module Allergies (Allergen(..), isAllergicTo, allergies) where

import Data.Bits

data Allergen = Eggs 
              | Peanuts 
              | Shellfish 
              | Strawberries 
              | Tomatoes 
              | Chocolate 
              | Pollen 
              | Cats 
              deriving (Show, Eq, Enum, Bounded)

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergy score = testBit score allergyBit
                           where allergyBit = fromEnum allergy

allergies :: Int -> [Allergen]
allergies score = filter scoreAllergicTo allAllergies
                where scoreAllergicTo = flip isAllergicTo score
                      allAllergies    = enumFrom minBound