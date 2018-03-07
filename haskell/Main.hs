import Lists 

{- testIt takes as input a String and a test, prints the String and
   evaluates the test.
-}
testIt :: (Show t) => (String, t) -> IO ()
testIt (s,f) = do 
    putStr "\n" 
    putStr s
    putStr "\n"
    print (f)

{- main executes a sequence of tests. Each test is an ordered pair
   of (String, t), where t is the test. Add tests as you like or
   remove tests if you like.
-}
main = do 
    let add1 x = 1 + x
    let add2 x = 2 + x
    mapM testIt [
        ("take 3 countingNumbers", take 3 countingNumbers),
        ("take 10 evenNumbers", take 10 evenNumbers)),
        ("take 10 primeNumbers", take 10 primeNumbers),
        ("merge (take 10 evenNumbers) (take 10 primeNumbers)", merge (take 10 evenNumbers) (take 10 primeNumbers)),
        ("slice (1,3) (take 20 countingNumbers)", slice (1,3) (take 20 countingNumbers)),  
        ("slice (17,22) (take 20 countingNumbers)", slice (17,22) (take 20 countingNumbers)),
        ("wrap 5 (take 10 countingNumbers)", wrap 5 (take 10 countingNumbers)),
        ("wrap 10 (take 10 countingNumbers)", wrap 10 (take 10 countingNumbers))
        ]
    mapM testIt [
        ("subLists (take 5 countingNumbers)", subLists (take 5 countingNumbers))
        ]
    mapM testIt [
        ("countElements (take 3 countingNumbers)", countElements ((take 3 countingNumbers))
        ]
    mapM testIt [
        ("sortSubLists (take 5 countingNumbers)", sortSubLists (take 5 countingNumbers))
        ]
    mapM testIt [
        ("listApply (+) (subLists (countingNumbers 5))", listApply (+) (subLists (countingNumbers 5)))
        ]
    mapM testIt [
        ("(composeList [add1 add2 add1]) 3", ((composeList [add1 add2 add1]) 3))
        ]
