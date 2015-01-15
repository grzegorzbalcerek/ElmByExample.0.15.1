module Fibonacci where


import List ((::), head, map2, reverse, tail)


fibonacci : Int -> List Int
fibonacci n =
    let fibonacci' n acc =
            if n <= 2
                then acc
                else fibonacci' (n-1) ((head acc + (tail >> head) acc) :: acc)
    in
        fibonacci' n [1,1] |> reverse


fibonacciWithIndexes : Int -> List (Int,Int)
fibonacciWithIndexes n = map2 (,) [0..n] (fibonacci n)
