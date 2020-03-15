---Hamzah Malik          ID: ACSF375

module MyAnimation where

import Animation

picture :: Animation
picture = background `plus` circleList `plus` innerCircle

background:: Animation
background = withPaint (cycleSmooth 5 [black, grey, purple, white])
                (rect (always 800) (always 600))

circleSetup :: Animation
circleSetup = 
        withBorder (always black) (always 1)
         (withPaint (cycleSmooth 4([purple, fuchsia, navy, teal, aqua, olive, yellow, red, maroon,gray, black, white]))
          (circle (always 30)))

circleList:: Animation
circleList = 
           combine (
             [translate (cycleSmooth (0.5+t) [(400, 350 + j), (500 + j, 250), (400, 150 - j), (300 - j, 250)])
              (scale (cycleSmooth 3 [(1,1), (1,1), (1,1), (2,2)])
               (circleSetup)) | t<- [0.2,0.25..5], j <- [0,80..240]])

innerCircle:: Animation
innerCircle = 
          translate (always (400, 250))
            (scale (always (1, 1))
              (withBorder (always white) (always 1)
               (withPaint (cycleSmooth 4 [white, gray, silver, black])
                 (circle (always 30)))))

test :: IO ()
test = writeFile "test.svg" (svg 800 600 picture)