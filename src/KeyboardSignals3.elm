module KeyboardSignals3 where


import Char
import Keyboard
import Signal ((<~))
import Text (asText)


main = asText <~ (Keyboard.isDown (Char.toCode 'A'))
