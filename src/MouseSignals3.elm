module MouseSignals3 where


import Graphics.Element (down, flow)
import List (map)
import Mouse
import Signal ((~), (<~), sampleOn)
import Text (plainText)


showsignals a b c d e f g =
    flow
        down
        <|
            map
                plainText
                [
                    "Mouse.position: " ++ toString a,
                    "Mouse.x: " ++ toString b,
                    "Mouse.y: " ++ toString c,
                    "Mouse.clicks: " ++ toString d,
                    "Mouse.isDown: " ++ toString e,
                    "sampleOn Mouse.clicks Mouse.position: " ++ toString f,
                    "sampleOn Mouse.isDown Mouse.position: " ++ toString g
                ]


main =
    showsignals
        <~ Mouse.position
        ~ Mouse.x
        ~ Mouse.y
        ~ Mouse.clicks
        ~ Mouse.isDown
        ~ sampleOn Mouse.clicks Mouse.position
        ~ sampleOn Mouse.isDown Mouse.position
