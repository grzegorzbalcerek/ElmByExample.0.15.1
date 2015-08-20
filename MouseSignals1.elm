module MouseSignals1 where


import Mouse
import Signal exposing (map)
import Graphics.Element exposing (show)


main = map show Mouse.x
