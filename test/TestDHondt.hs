module TestDHondt where

import DHondt (dHondt)

import Test.Tasty
import Test.Tasty.HUnit

data Parties = PartyA
             | PartyB
             | PartyC
             | PartyD
             | PartyE
             | PartyF
             | CoalitionBCD
             deriving (Eq, Show)

tests :: TestTree
tests = testGroup
    "DHondt"
    [ wikipediaExample1
    , wikipediaExample2
    , regExample1
    ]


-- Wikipedia examples from https://en.wikipedia.org/wiki/D%27Hondt_method

wikipediaExample1 :: TestTree
wikipediaExample1 = testGroup "Wikipedia Example 1"
  [ testCase "Party A" $ assertEqual "Party A" 4 (seatsByParty PartyA)
  , testCase "Party B" $ assertEqual "Party B" 3 (seatsByParty PartyB)
  , testCase "Party C" $ assertEqual "Party C" 1 (seatsByParty PartyC)
  , testCase "Party D" $ assertEqual "Party D" 0 (seatsByParty PartyD)
  ]
  where
    votingResult :: Parties -> Int
    votingResult PartyA = 100000
    votingResult PartyB = 80000
    votingResult PartyC = 30000
    votingResult PartyD = 20000
    votingResult _ = 0

    seatsByParty = dHondt votingResult [PartyA, PartyB, PartyC, PartyD] 8


wikipediaExample2 :: TestTree
wikipediaExample2 = testGroup "Wikipedia Example 2"
  [ testCase "Party A" $ assertEqual "Party A" 3 (seatsByParty PartyA)
  , testCase "Coalition B-C-D" $ assertEqual "Coalition B-C-D" 5 (seatsByParty CoalitionBCD)
  ]
  where
    votingResult :: Parties -> Int
    votingResult PartyA = 100000
    votingResult CoalitionBCD = 130000
    votingResult _ = 0

    seatsByParty = dHondt votingResult [PartyA, CoalitionBCD] 8

{-
From: https://www.boe.es/buscar/pdf/1985/BOE-A-1985-11672-consolidado.pdf (P59 Artículo ciento sesenta y tres)

Ejemplo práctico: 480.000 votos válidos emitidos en una circunscripción que elija ocho
Diputados. Votación repartida entre seis candidaturas:
A(168.000 votos) B(104.000) C(72.000) D(64.000) E(40.000) F(32.000)

Por consiguiente: la candidatura A obtiene cuatro escaños. La candidatura B dos
escaños y las candidaturas C y D un escaño cada una.
-}

regExample1 :: TestTree
regExample1 = testGroup "Régimen Electoral General Example 1"
  [ testCase "Party A" $ assertEqual "Party A" 4 (seatsByParty PartyA)
  , testCase "Party B" $ assertEqual "Party B" 2 (seatsByParty PartyB)
  , testCase "Party C" $ assertEqual "Party C" 1 (seatsByParty PartyC)
  , testCase "Party D" $ assertEqual "Party D" 1 (seatsByParty PartyD)
  , testCase "Party E" $ assertEqual "Party E" 0 (seatsByParty PartyE)
  , testCase "Party F" $ assertEqual "Party F" 0 (seatsByParty PartyF)
  ]
  where
    votingResult :: Parties -> Int
    votingResult PartyA = 168000
    votingResult PartyB = 104000
    votingResult PartyC = 72000
    votingResult PartyD = 64000
    votingResult PartyE = 40000
    votingResult PartyF = 32000
    votingResult _ = 0

    seatsByParty = dHondt votingResult [PartyA, PartyB, PartyC, PartyD, PartyE, PartyF] 8
