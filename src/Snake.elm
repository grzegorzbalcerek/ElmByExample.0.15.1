module Snake where


import Graphics.Element (Element)
import Signal ((<~), Signal)
import SnakeState (..)
import SnakeView (..)


main : Signal Element
main = view <~ stateSignal
