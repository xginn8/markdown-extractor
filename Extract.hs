import System.IO
import System.Environment
import Data.List

main = do
    header:file:args <- getArgs
    -- putStrLn ("Searching for '" ++ header ++ "' in " ++ file)
    withFile file ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr $ processText header contents)

processText :: String -> String -> String
processText tgt input =
    let removed = dropWhile (not . matchesHeader tgt) $ lines input
        lvl = getHeadingLevel (head removed)
        children = takeWhile (\x -> matchesHeader tgt x || getHeadingLevel x /= lvl) removed
        result = unlines $ tail children
    in  result

matchesHeader :: String -> String -> Bool
matchesHeader tgt line =
    ("# " <> tgt) `isInfixOf` line

getHeadingLevel :: String -> Int
getHeadingLevel str =
    length $ takeWhile (=='#') str
