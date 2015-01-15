module TicTacToe where


import Graphics.Element (Element)
import Mouse
import Signal ((<~), Signal, foldp, mergeMany, sampleOn, subscribe)
import TicTacToeModel (..)
import TicTacToeView (..)


clickSignal : Signal (Int,Int)
clickSignal = sampleOn Mouse.clicks Mouse.position


newGameButtonSignal : Signal ()
newGameButtonSignal = subscribe newGameChannel


undoButtonSignal : Signal ()
undoButtonSignal = subscribe undoChannel


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
