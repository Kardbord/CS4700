module Lists where

  -- I've left this sample definition in here, you should delete it
  oddNumbers :: Int -> [Int]
  oddNumbers n = [ x | x <- [1..n], (mod x 1) == 0] 
