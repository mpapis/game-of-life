#!/usr/bin/env ruby

require "./game"

# Still lifes
BLOCK=[ [1,1], [1,2], [2,1], [2,2] ]
BEE_HIVE=[ [2,1], [3,1], [1,2], [4,2], [2,3], [3,3] ]
LOAF=[ [2,1], [3,1], [1,2], [4,2], [2,3], [4,3], [3,4] ]
BOAT=[ [1,1], [2,1], [1,2], [3,2], [2,3] ]
WHEEL=[ [2,1], [3,1], [1,2], [4,2], [1,3], [4,3], [2,4], [3,4] ]
# Oscilators
BLINKER=[ [1,1], [1,2], [1,3] ]
TOAD=[ [1,1], [1,2], [1,3], [2,2], [2,3], [2,4] ]
BEACON=[ [1,1], [2,1], [1,2], [2,2], [3,3], [4,3], [3,4], [4,4]]
# Spaceships
GLIDER=[ [2,1], [3,2], [1,3], [2,3], [3,3] ]

game = Game.new(40,41)
game.start [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], [1,8], [1,9], [1,10], :transform => [12,14]
game.start [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], [1,8], [1,9], [1,10], :transform => [19,14]
game.start [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], [1,8], [1,9], [1,10], :transform => [26,14]
game.play_console #0.02
