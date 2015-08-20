module Fibonacci where


import List exposing ((::), map2, reverse)


fibonacci : Int -> List Int
fibonacci n =
    let fibonacci' n k1 k2 acc =
            if n <= 0
                then acc
                else fibonacci' (n-1) k2 (k1+k2) (k2 :: acc)
    in
        fibonacci' n 0 1 [] |> reverse


fibonacciWithIndexes : Int -> List (Int,Int)
fibonacciWithIndexes n = map2 (,) [0..n] (fibonacci n)
