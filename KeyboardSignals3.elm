module KeyboardSignals3 where


import Char
import Graphics.Element exposing (show)
import Keyboard
import Signal exposing ((<~))


main = show <~ Keyboard.isDown (Char.toCode 'A')
