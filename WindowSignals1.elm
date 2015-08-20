module WindowSignals1 where


import Graphics.Element exposing (down, flow, leftAligned)
import List exposing (map)
import Signal exposing ((~), (<~))
import Text exposing (fromString)
import Window


showsignals a b c =
    flow down <|
        map (fromString >> leftAligned) [
                "Window.dimensions: " ++ toString a,
                "Window.width: " ++ toString b,
                "Window.height: " ++ toString c
            ]


main =
    showsignals
        <~ Window.dimensions
        ~ Window.width
        ~ Window.height
