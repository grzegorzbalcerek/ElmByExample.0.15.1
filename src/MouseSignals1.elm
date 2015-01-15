module MouseSignals where


import Mouse
import Signal (map)
import Text (asText)


main = map asText Mouse.x
