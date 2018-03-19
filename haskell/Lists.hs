module Lists where
import Data.List

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

-- Returns a sublist of @xs
-- Note that indexing begins at 1 for obtaining a sublist
-- E.g., to get the first through third element of xs, call 'slice (1, 3) xs'
-- 
-- param a  : the lower index of the range desired from @xs
-- param b  : the upper index of the range desired from @xs
-- param xs : a list
-- return   : the sublist from the @a-th element of xs to the @b-th element of xs
slice :: (Int, Int) -> [a] -> [a]
slice (a, b) [] = []
slice (a, b) xs | (a < 1 || b < 1) = []
slice (a, b) xs | a > b = []
slice (a, b) xs | b > (length xs) = slice (a, (length xs)) xs
slice (a, b) xs | (a == b) = [(xs !! (a - 1))]
slice (a, b) xs | a >= 1, b > 1 = [(xs !! (a - 1))] ++ (slice (a + 1, b) xs)

-- Creates a list of sub-lists, where the n-th sub-list is a list of elements
-- from 1 to n in the original list.
--
-- param xs : a list
-- return   : a list of sub-lists, where the n-th sub-list is a list of elements
--            from 1 to n in @xs
subLists :: [a] -> [[a]]
subLists [] = []
subLists xs = [slice (1, x) xs | x <- [1..(length xs)]]

-- Counts the total number of elements in a list of lists
--
-- param xs : a list of lists
-- return   : the total number of elements in the sublists of @xs
countElements :: [[a]] -> Int
countElements [] = 0
countElements xs = sum [length x | x <- xs]

-- Sorts a list of lists of integers ascending by comparing the sum of each sublist
-- 
-- param xs : a list of lists of integers
-- return   : @xs sorted ascending according to the sum of each element's contents
sortSubLists :: [[Int]] -> [[Int]]
sortSubLists [] = []
sortSubLists xs = 
    sortBy 
    (\ys zs -> 
        case () of
        _ | (sum ys < sum zs) -> LT 
          | (sum ys > sum zs) -> GT 
          | (sum ys == sum zs) -> EQ
    ) 
    xs

-- TODO: documentListApplyHelper
listApplyHelper :: (a -> a -> a) -> [a] -> a
listApplyHelper f xs | ((length xs) <= 2) = foldl f (head xs) (tail xs) 
listApplyHelper f xs = listApplyHelper f (w ++ [f (v !! 0) (v !! 1)])
    where
        w = (take ((length xs) - 2) xs) -- all but the last two elements of xs
        v = (drop ((length xs) - 2) xs) -- the last two elements of xs

-- TODO: document listApply
listApply :: (a -> a -> a) -> [[a]] -> [a]
listApply f [] = []
listApply f xs = [listApplyHelper f x | x <- xs]
