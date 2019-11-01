module Main where

import System.Random
import RSAkeys
import Print

main :: IO ()
main = do
  Print.welcome
  num_bits_in <-  getLine 
  let num_bits = (read num_bits_in :: Int)
  seed1 <- newStdGen
  seed2 <- newStdGen
  let (public,private) = RSAkeys.gen_keys_by_bits num_bits seed1 seed2
  mainLoop public private
--  Print.keys public private
  
  putStrLn "end"

mainLoop public private= 
  while True = do
    Print.whatDoYouWannaDo
    option <- getChar
    case option of 
      '1' ->  Print.keys public private
      _ -> putStrLn "asd"
    
