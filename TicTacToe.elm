module TicTacToe where


import Graphics.Element exposing (Element)
import Mouse
import Signal exposing ((<~), Signal, foldp, mergeMany, sampleOn)
import TicTacToeModel exposing (..)
import TicTacToeView exposing (..)


clickSignal : Signal (Int,Int)
clickSignal = sampleOn Mouse.clicks Mouse.position


newGameButtonSignal : Signal ()
newGameButtonSignal = newGameMailbox.signal


undoButtonSignal : Signal ()
undoButtonSignal = undoMailbox.signal


newGameSignal : Signal (GameState -> GameState)
newGameSignal = always (always initialState) <~ newGameButtonSignal


undoSignal : Signal (GameState -> GameState)
undoSignal = always undoMoves <~ undoButtonSignal


moveSignal : Signal (GameState -> GameState)
moveSignal = processClick <~ clickSignal


inputSignal : Signal (GameState -> GameState)
inputSignal = mergeMany [ moveSignal, newGameSignal, undoSignal ]


gameStateSignal : Signal GameState
gameStateSignal = foldp (<|) initialState inputSignal


main : Signal Element
main = view <~ gameStateSignal
