module KeyboardSignals1 where


import Keyboard
import Signal ((<~))
import Text (asText)


main = asText <~ Keyboard.keysDown
