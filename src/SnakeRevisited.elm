module SnakeRevisited where


import Graphics.Element (Element)
import Signal ((<~), Signal)
import SnakeStateRevisited (..)
import SnakeView (..)


main : Signal Element
main = view <~ stateSignal
