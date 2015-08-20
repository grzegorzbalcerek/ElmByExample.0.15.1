module CirclesView where


import CirclesModel exposing (Circle, CircleSpec, Position)
import Color exposing (black, red, green)
import Graphics.Collage exposing (circle, collage, filled,
    move, outlined, rect, solid)
import Graphics.Element exposing (layers)
import List exposing (map)


boundingBox w h =
    collage w h [
            outlined (solid black) <| rect (toFloat w) (toFloat h),
            outlined (solid black) <| rect (toFloat (w-2)) (toFloat (h-2))
        ]


drawCircle w h {position, circleSpec} =
    filled circleSpec.col (circle (toFloat circleSpec.radius))
        |> move (toFloat position.x - (toFloat w)/2,
                 (toFloat h)/2 - toFloat position.y)


drawCircles w h circles = collage w h (map (drawCircle w h) circles)


view w h circles = layers [ boundingBox w h, drawCircles w h circles ]


main = view 400 400 [
            { circleSpec = { col = red, radius = 26 },
              position = { x = 0, y = 0 } },
            { circleSpec = { col = green, radius = 43 },
              position = { x = 200, y = 200 } }
        ]
