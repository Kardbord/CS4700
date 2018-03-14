module Lists where

-- TODO: delete this
-- I've left this sample definition in here, you should delete it
oddNumbers :: Int -> [Int]
oddNumbers n = [ x | x <- [1..n], (mod x 1) == 0] 

-- Provides an infinite list of whole numbers beginning at 1
countingNumbers :: [Integer]
countingNumbers = [1..]

-- Provides an infinite list of even numbers beginning at 2
evenNumbers :: [Integer]
evenNumbers = [x * 2 | x <- countingNumbers]

-- Provides an infinite list of prime numbers
-- Primes are computed using Wilson's Theorem
-- https://en.wikipedia.org/wiki/Wilson%27s_theorem#Example
primeNumbers :: [Integer]
primeNumbers = [x | x <- [2..], ((product [1..x-1] + 1) `mod` x == 0)]

-- Merges two lists of Integers together
-- Assumes the two lists are already sorted
merge :: [Integer] -> [Integer] -> [Integer]
merge xs1 [] = xs1
merge [] xs2 = xs2
merge xs1 xs2 = 
    if head xs1 <= head xs2
        then (head xs1) : (merge (tail xs1) xs2)
        else (head xs2) : (merge (tail xs2) xs1)
