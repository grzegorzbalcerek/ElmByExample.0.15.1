module DrawCircles where


import Array as A
import Color exposing (Color, blue, brown, green, orange, purple, red, yellow)
import Graphics.Collage exposing (Form, circle, collage, filled, move)
import Graphics.Element exposing (Element)
import List exposing (map)
import Maybe


color : Int -> Color
color n =
    let colors =
            A.fromList [ green, red, blue, yellow, brown, purple, orange ]
        maybeColor = A.get (n % (A.length colors)) colors
    in
        Maybe.withDefault green maybeColor


circleForm : (Int, (Int, Int)) -> Form
circleForm (r, (x, y)) =
    circle (toFloat r*5)
        |> filled (color r)
        |> move (toFloat x,toFloat y)


drawCircles : List (Int, (Int, Int)) -> (Int, Int) -> Element
drawCircles d (w, h) = collage w h <| map circleForm d


main =
    drawCircles [
            (3, (-200, 0)),
            (4, (-100, 0)),
            (5, (0, 0)),
            (7, (100, 0)),
            (9, (200, 0))
        ]
        (600, 400)
