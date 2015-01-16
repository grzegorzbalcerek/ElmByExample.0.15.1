module MouseSignals1 where


import Mouse
import Signal (map)
import Text (asText)


main = map asText Mouse.x
