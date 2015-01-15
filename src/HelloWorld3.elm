module HelloWorld3 where


import Color (blue)
import Graphics.Element (..)
import Text as T


makeBlue : T.Text -> T.Text
makeBlue = T.color blue


main : Element
main =
    T.fromString "Hello World"
        |> makeBlue
        |> T.italic
        |> T.bold
        |> T.height 60
        |> T.leftAligned
