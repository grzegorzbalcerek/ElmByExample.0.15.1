module SnakeRevisited where


import Graphics.Element exposing (Element)
import Signal exposing ((<~), Signal)
import SnakeStateRevisited exposing (..)
import SnakeView exposing (..)


main : Signal Element
main = view <~ stateSignal
