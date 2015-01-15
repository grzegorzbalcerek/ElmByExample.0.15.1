module CirclesModel where


import Color (Color, rgb)
import Time (Time)
import Random (generate, int, initialSeed)


type alias Position = { x: Int, y: Int }


type alias CircleSpec = {
         radius: Int,
         xv: Int,
         yv: Int,
         col: Color,
         creationTime: Time
     }


type alias Circle = {
         position: Position,
         circleSpec: CircleSpec
     }


makeCircleSpec : Time -> CircleSpec
makeCircleSpec time =
    let seed1 = initialSeed (round time)
        (radius,seed2) = generate (int 10 30) seed1
        (xv,seed3) = generate (int 10 50) seed2
        (yv,seed4) = generate (int 10 50) seed3
        (r,seed5) = generate (int 10 220) seed4
        (g,seed6) = generate (int 10 220) seed5
        (b,_) = generate (int 10 220) seed6
    in
        { radius = radius
        , xv = xv
        , yv = yv
        , col = rgb r g b
        , creationTime = time
        }
