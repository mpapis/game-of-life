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

game = Game.new(40,40)
game.start *BLINKER, :transform => [10,10]
game.start *BLOCK, :transform => [20,10]
game.start *LOAF, :transform => [10,20]
game.start *BOAT, :transform => [20,20]
game.start *BEE_HIVE, :transform => [10,30]
game.start *TOAD, :transform => [20,30]
game.start *BEACON, :transform => [30,10]
game.start *WHEEL, :transform => [30,20]
game.start *GLIDER, :transform => [30,31]
game.play_console 0.02
