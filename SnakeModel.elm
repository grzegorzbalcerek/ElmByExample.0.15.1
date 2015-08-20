module SnakeModel where


import Maybe exposing (withDefault)
import List exposing ((::), drop, head, isEmpty, map, reverse)
import Set


type alias Position =
    { x: Int
    , y: Int
    }


type alias Delta =
    { dx: Int
    , dy: Int
    }


type alias Snake =
    { front: List Position
    , back: List Position
    }


type alias SnakeState =
    { snake: Snake
    , delta: Delta
    , food: Maybe Position
    , ticks: Int
    , gameOver: Bool
    }


initialSnake =
    { front = [{x = 0, y = 0}, {x = 0, y = -1}, {x = 0, y = -2}, {x = 0, y = -3}]
    , back = []
    }


initialDelta = { dx = 0, dy = 1 }


initialFood = Nothing


initialState =
    { snake = initialSnake
    , delta = initialDelta
    , food = initialFood
    , ticks = 0
    , gameOver = False
    }


type Event = Tick Position | Direction Delta | NewGame | Ignore


boardSize = 15


boxSize = boardSize + boardSize + 1


velocity = 5


nextPosition : Snake -> Delta -> Position
nextPosition snake {dx,dy} =
    let headPosition = head snake.front |> withDefault {x=0,y=0}
    in  { x = headPosition.x + dx, y = headPosition.y + dy }


moveSnakeForward : Snake -> Delta -> Maybe Position -> Snake
moveSnakeForward snake delta food =
    let next = nextPosition snake delta
        tailFunction =
            case food of
                Nothing -> drop 1
                Just f -> if next == f then identity else drop 1
    in
        if isEmpty snake.back
        then { front = [next]
             , back = (tailFunction << reverse) snake.front }
        else { front = next :: snake.front
             , back = tailFunction snake.back }



isInSnake : Snake -> Position -> Bool
isInSnake snake position =
    let frontSet = Set.fromList <| map toString snake.front
        backSet = Set.fromList <| map toString snake.back
    in
        Set.member (toString position) frontSet || Set.member (toString position) backSet



collision : SnakeState -> Bool 
collision state = 
    let next = nextPosition state.snake state.delta
    in
        if abs next.x > boardSize || abs next.y > boardSize || isInSnake state.snake next
        then True
        else False
