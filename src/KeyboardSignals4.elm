module KeyboardSignals4 where


import Keyboard
import Signal ((<~))
import Text (asText)


main = asText <~ (Keyboard.directions 81 65 79 80)
