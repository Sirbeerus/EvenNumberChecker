module Main where


import Text.Read (readMaybe)




-- Define a function to check if a number is even and return an 'Either' result
isEven :: Int -> Either String Int
isEven n
  | even n = Right n
  | otherwise = Left "Number is odd"

-- A function to display the result
displayResult :: Either String Int -> IO ()
displayResult (Left errMsg) = putStrLn $ "Error: " ++ errMsg
displayResult (Right n) = putStrLn $ "Number " ++ show n ++ " is even."

main :: IO ()
main = do
  putStrLn "Even Number Checker"
  putStr "Enter a number: "
  input <- getLine
  putStrLn $ "Received input: " ++ input

  let maybeNumber = readMaybe input :: Maybe Int
  putStrLn $ "Parsed as a Maybe Int: " ++ show maybeNumber

  case maybeNumber of
    Just number ->
      displayResult (isEven number)
    Nothing ->
      putStrLn "Invalid input. Please enter a valid integer."

