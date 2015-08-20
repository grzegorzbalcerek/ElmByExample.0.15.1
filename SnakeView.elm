module SnakeView where


import Color exposing (Color, black, blue, green, red, white)
import Graphics.Collage exposing (Form, collage, filled, move, rect)
import Graphics.Element exposing (Element, centered, container, empty, midBottom, middle, layers)
import List exposing (map)
import Maybe
import SnakeModel exposing (..)
import Text


unit = 15


innerSize = unit * boxSize


outerSize = unit * (boxSize+1)


box =
    collage outerSize outerSize [
        filled black <| rect outerSize outerSize,
        filled white <| rect innerSize innerSize ]


drawPosition : Color -> Position -> Form
drawPosition color position =
    filled color (rect unit unit) |>
    move (toFloat (unit*position.x), toFloat (unit*position.y))


drawPositions : Color -> List Position -> Element
drawPositions color positions =
    collage outerSize outerSize (map (drawPosition color) positions)


drawFood : Position -> Element
drawFood position = drawPositions green [position]


gameOver : Element
gameOver =
    Text.fromString "Game Over"
        |> Text.color red
        |> Text.bold
        |> Text.height 60
        |> centered
        |> container outerSize outerSize middle


instructions : Element
instructions =
    Text.fromString "Press the arrows to change the snake move direction.\nPress N to start a new game."
        |> centered
        |> container outerSize (outerSize+3*unit) midBottom


view state =
    layers [ box
           , instructions
           , drawPositions blue state.snake.front
           , drawPositions blue state.snake.back
           , Maybe.withDefault empty <| Maybe.map drawFood state.food
           , if state.gameOver then gameOver else empty
           ]


main = view initialState
