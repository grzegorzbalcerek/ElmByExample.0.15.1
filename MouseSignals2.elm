module MouseSignals2 where


import Graphics.Element exposing (Element, show)
import Mouse
import Signal exposing (map2)


combine : a -> b -> Element
combine a b = show (a,b)


main = map2 combine Mouse.x Mouse.y
