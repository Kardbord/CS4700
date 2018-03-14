module Lists where

-- TODO: delete this
-- I've left this sample definition in here, you should delete it
oddNumbers :: Int -> [Int]
oddNumbers n = [ x | x <- [1..n], (mod x 1) == 0] 

-- Provides an unbounded list of whole numbers beginning at 1.
--
-- return : an unbounded list of positive integers
countingNumbers :: [Integer]
countingNumbers = [1..]

-- Provides an unbounded list of even numbers beginning at 2.
--
-- return : an unbounded list of positive even numbers
evenNumbers :: [Integer]
evenNumbers = [x * 2 | x <- countingNumbers]

-- Provides an unbounded list of prime numbers.
-- Primes are computed using Wilson's Theorem.
-- https://en.wikipedia.org/wiki/Wilson%27s_theorem#Example
--
-- return : an unbounded list of prime numbers
primeNumbers :: [Integer]
primeNumbers = [x | x <- [2..], ((product [1..x-1] + 1) `mod` x == 0)]

-- Merges two lists of Integers together.
-- Assumes the two lists are already sorted.
--
-- param xs1 : a sorted list
-- param xs2 : a sorted list
-- return    : @xs1 and @xs2 merged into one sorted list
merge :: [Integer] -> [Integer] -> [Integer]
merge xs1 [] = xs1
merge [] xs2 = xs2
merge xs1 xs2 = 
    if head xs1 <= head xs2
        then (head xs1) : (merge (tail xs1) xs2)
        else (head xs2) : (merge (tail xs2) xs1)

-- Wraps @xs by @k elements.
-- (@k > 0) moves the first @k elements to the back of the list.
-- (@k < 0) moves the last abs(@k) elements to the front of the list.
-- abs(@k) can be larger than the size of xs
-- 
-- param k  : any integer; the number by which to wrap @xs
-- param xs : a list of any type
-- return   : @xs wrap by @k elements
wrap :: Int -> [a] -> [a]
wrap k [] = []
wrap 0 xs = xs
wrap 1 xs = (tail xs) ++ [(head xs)]
wrap k xs | k > 0 = wrap (k - 1) ((tail xs) ++ [(head xs)])
wrap k xs | k < 0 = wrap ((length xs) + k) xs
