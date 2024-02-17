-- Optional debugger to step through the love2d game
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end
--- end of debugger

local STI = require("libraries.sti")

function love.load()
   love.graphics.setDefaultFilter("nearest", "nearest")
   Map = STI("maps/tiletestmap.lua") -- Map exported from Tiled.
   require('player') -- Includes player, player animation
   
end
 
function love.update(dt)
   Player.currentAnimation = Player.animations.idle
   if love.keyboard.isDown("right") then
      Player.x = Player.x + (Player.speed * dt)
      Player.currentAnimation = Player.animations.right
   end
   if love.keyboard.isDown("left") then
      Player.x = Player.x - (Player.speed * dt)
      Player.currentAnimation = Player.animations.left
   end
 
   if love.keyboard.isDown("down") then
      Player.y = Player.y + (Player.speed * dt)
      Player.currentAnimation = Player.animations.down
   end
   if love.keyboard.isDown("up") then
      Player.y = Player.y - (Player.speed * dt)
      Player.currentAnimation = Player.animations.up
   end

    if love.keyboard.isDown("r") then
        Player.y = 0
        Player.x = 0
    end
    Player.currentAnimation:update(dt)

end
 
function love.draw()
   Map:draw()
   Player.currentAnimation:draw(Player.spriteSheet, Player.x, Player.y, nil, 1)
end
