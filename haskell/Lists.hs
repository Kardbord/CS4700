module Lists where

-- I've left this sample definition in here, you should delete it
oddNumbers :: Int -> [Int]
oddNumbers n = [ x | x <- [1..n], (mod x 1) == 0] 

-- Provides an infinite list of whole numbers beginning at 1
countingNumbers :: [Integer]
countingNumbers = [1..]

-- Provides an infinite list of even numbers beginning at 2
evenNumbers :: [Integer]
evenNumbers = [x * 2 | x <- countingNumbers]

-- Merges two lists of Integers together
-- Assumes the two lists are already sorted
merge :: [Integer] -> [Integer] -> [Integer]
merge xs1 [] = xs1
merge [] xs2 = xs2
merge xs1 xs2 = 
    if head xs1 <= head xs2
        then (head xs1) : (merge (tail xs1) xs2)
        else (head xs2) : (merge (tail xs2) xs1)
