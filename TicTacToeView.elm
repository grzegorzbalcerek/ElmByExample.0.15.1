module TicTacToeView where


import Color exposing (black, white)
import Graphics.Collage exposing (circle, collage, filled, group, move, rect, rotate)
import Graphics.Element exposing (Element, container, down, flow, layers, leftAligned, middle, right, spacer)
import Graphics.Input exposing (button)
import List exposing (map)
import Signal exposing (Mailbox, mailbox, message)
import Text exposing (fromString)
import TicTacToeModel exposing (..)


drawLines : Element
drawLines =
    collage 300 300 [
        filled black (rect 3 300) |> move (-50,0),
        filled black (rect 3 300) |> move (50,0),
        filled black (rect 300 3) |> move (0,-50),
        filled black (rect 300 3) |> move (0,50)
    ]


drawMoves : GameState -> Element
drawMoves state =
    let moveSign player =
            group (case player of
                      X ->
                          let xline = filled black (rect 5 64)
                          in  [ rotate (degrees 45) xline
                              , rotate (degrees 135) xline
                              ]
                      O ->
                          [ filled black <| circle 30
                          , filled white <| circle 25
                          ]
                  )
        playerMove ({col,row}, player) =
            moveSign player |> move (toFloat <| 100*col-200,toFloat <| -100*row+200)
    in
        collage 300 300 (map playerMove <| moves state)


stateDescription : GameState -> String
stateDescription state =
    case state of
      FinishedGame Draw _ -> "Game Over. Draw"
      FinishedGame (Winner p) _ -> "Game Over. Winner: " ++ toString p
      NotFinishedGame p _ -> "Next move: " ++ toString p


newGameMailbox : Mailbox ()
newGameMailbox = mailbox ()


newGameButton : Element
newGameButton = button (message newGameMailbox.address ()) "New Game"


undoMailbox : Mailbox ()
undoMailbox = mailbox ()


undoButton : Element
undoButton = button (message undoMailbox.address ()) "Undo"


view : GameState -> Element
view state =
    flow down [
        layers [drawLines, drawMoves state],
        container 300 60 middle <| leftAligned <| fromString <| stateDescription state,
        container 300 60 middle <| flow right [undoButton, spacer 20 20, newGameButton]
    ]
