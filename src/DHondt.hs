module DHondt where

import Data.List (sortBy)
import Data.Ord (comparing)

dHondt :: (Eq a)
       => (a -> Int)  -- A map from parties to vote count
       -> [a]         -- A list of parties
       -> Int         -- The number of seats
       -> (a -> Int)  -- A map from parties to seat count
dHondt votesOf parties seatCount party = length $ filter (== party) seats
    where
        tableCells = [ (party, (votesOf party) `div` n ) | party <- parties, n <- [1..seatCount] ]
        sortedCells = sortBy (flip $ comparing snd) tableCells
        seats = take seatCount $ map fst sortedCells

