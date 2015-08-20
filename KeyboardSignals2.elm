module KeyboardSignals2 where


import Graphics.Element exposing (show)
import Keyboard
import Signal exposing ((<~))


main = show <~ Keyboard.presses
