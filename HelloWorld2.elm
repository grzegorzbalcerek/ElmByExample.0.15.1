module HelloWorld2 where


import Color exposing (blue)
import Graphics.Element exposing (..)
import Text


main : Element
main =
    Text.fromString "Hello World"
        |> Text.color blue
        |> Text.italic
        |> Text.bold
        |> Text.height 60
        |> leftAligned
