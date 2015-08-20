module Snake where


import Graphics.Element exposing (Element)
import Signal exposing ((<~), Signal)
import SnakeState exposing (..)
import SnakeView exposing (..)


main : Signal Element
main = view <~ stateSignal
