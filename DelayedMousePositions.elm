module DelayedMousePositions where


import Graphics.Element exposing (show)
import List
import List exposing ((::), foldr, length, repeat)
import Mouse
import Signal
import Signal exposing (Signal, (~), (<~), constant)
import Time exposing (delay)
import Window


combine : List (Signal a) -> Signal (List a)
combine = foldr (Signal.map2 (::)) (constant [])


delayedMousePositions : List Int -> Signal (List (Int, (Int, Int)))
delayedMousePositions rs =
    let adjust (w, h) (x, y) = (x-w//2,h//2-y)
        n = length rs
        position = adjust <~ Window.dimensions ~ Mouse.position
        positions = repeat n position -- List (Signal (Int, Int))
        delayedPositions =            -- List (Signal (Int, (Int, Int))
            List.map2
            (\r pos ->
                let delayedPosition = delay (toFloat r*100) pos
                in
                    (\pos -> (r,pos)) <~ delayedPosition)
            rs
            positions
    in
        combine delayedPositions


main = show <~ delayedMousePositions [0,10,25]
