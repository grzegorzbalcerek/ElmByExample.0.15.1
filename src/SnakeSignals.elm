module SnakeSignals where


import Char
import Keyboard
import Random
import Signal ((<~), Signal, keepIf, mergeMany)
import SnakeModel (..)
import SnakeView (..)
import Time (Time, fps)


timeSignal : Signal Time
timeSignal = fps 50


makeTick : Time -> Event
makeTick time =
    let seed1 = Random.initialSeed (round time)
        (x,seed2) = Random.generate (Random.int -boardSize boardSize) seed1
        (y,_) = Random.generate (Random.int -boardSize boardSize) seed2
    in
        Tick { x = x, y = y }


tickSignal : Signal Event
tickSignal = makeTick <~ timeSignal


directionSignal : Signal Event
directionSignal =
  let arrowsToDelta {x,y} =
          if  | x == 0 && y == 0 -> Ignore
              | x /= 0 -> Direction { dx = x, dy = 0 }
              | otherwise  -> Direction { dx = 0, dy = y }          
  in
      arrowsToDelta <~ Keyboard.arrows


newGameSignal : Signal Event
newGameSignal =
    always NewGame <~ (keepIf identity False <| Keyboard.isDown (Char.toCode 'N'))


eventSignal : Signal Event
eventSignal = mergeMany [tickSignal, directionSignal, newGameSignal]
