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
