module FibonacciBars where


import Color (blue, brown, green, orange, purple, red, yellow)
import Fibonacci (fibonacci, fibonacciWithIndexes)
import Graphics.Collage (collage, filled, rect)
import Graphics.Element (down, flow, right)
import List (drop, head, length, map)
import Text (asText)


color n =
    let colors = [ red, orange, yellow, green, blue, purple, brown ]
    in
        drop (n % (length colors)) colors |> head


bar (index, n) =
    flow right [
        collage (n*20) 20 [ filled (color index) (rect (toFloat n * 20) 20) ],
        asText n
    ]


main = flow down <| map bar (fibonacciWithIndexes 10)
