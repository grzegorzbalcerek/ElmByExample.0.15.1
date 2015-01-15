module TimeSignals where


import Graphics.Element (down, flow)
import List (map)
import Mouse
import Signal ((~), (<~))
import Text (plainText)
import Time (delay, every, fps, fpsWhen, second, since, timestamp)


showsignals a b c d e f =
    flow
        down
        <|
            map
                plainText
                [
                    "every (5*second): " ++ toString a,
                    "since (2*second) Mouse.clicks: " ++ toString b,
                    "timestamp Mouse.isDown: " ++ toString c,
                    "delay second Mouse.position: " ++ toString d,
                    "fps 200: " ++ toString e,
                    "fpsWhen 200 Mouse.isDown: " ++ toString f
                ]


main = showsignals
           <~ every (5*second)
           ~ since (2*second) Mouse.clicks
           ~ timestamp Mouse.isDown
           ~ delay second Mouse.position
           ~ fps 200
           ~ fpsWhen 200 Mouse.isDown
