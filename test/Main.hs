import Test.Tasty

import qualified TestDHondt

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [TestDHondt.tests]

