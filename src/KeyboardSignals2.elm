module KeyboardSignals2 where


import Keyboard
import Signal ((<~))
import Text (asText)


main = asText <~ Keyboard.lastPressed
