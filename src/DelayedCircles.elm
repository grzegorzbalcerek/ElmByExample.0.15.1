module DelayedCircles where


import DelayedMousePositions (delayedMousePositions)
import DrawCircles (drawCircles)
import Fibonacci (fibonacci)
import List (reverse, tail)
import Signal ((~), (<~))
import Window


main =
    drawCircles
        <~ delayedMousePositions (fibonacci 8 |> tail |> reverse)
        ~ Window.dimensions
