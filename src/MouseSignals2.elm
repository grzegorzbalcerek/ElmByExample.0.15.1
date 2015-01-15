module MouseSignals2 where


import Graphics.Element (Element)
import Mouse
import Signal (map2)
import Text (asText)


combine : a -> b -> Element
combine a b = asText (a,b)


main = map2 combine Mouse.x Mouse.y
