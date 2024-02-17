Anim9 = require('libraries.anim8.anim8')
-- Player init
Player = {}
Player.x = 0
Player.y = 0
Player.speed = 200

-- Player sheet and animations
Player.spriteSheet = love.graphics.newImage("/assets/sprites/elftopsprite.png")
Player.grid = Anim9.newGrid(90, 98, Player.spriteSheet:getWidth(), Player.spriteSheet:getHeight())
Player.animations = {}
Player.animations.down = Anim9.newAnimation(Player.grid('1-10', 5), 0.05)
Player.animations.up = Anim9.newAnimation(Player.grid('1-10', 7), 0.05)
Player.animations.left = Anim9.newAnimation(Player.grid('1-10', 6), 0.05)
Player.animations.right = Anim9.newAnimation(Player.grid('1-10', 8), 0.05)
Player.animations.idle = Anim9.newAnimation(Player.grid('1-3', 1), 0.75)
