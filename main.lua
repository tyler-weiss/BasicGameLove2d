-- Optional debugger to step through the love2d game
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
   require("lldebugger").start()
end
--- end of debugger

local STI = require("libraries.sti")

function love.load()
   love.graphics.setDefaultFilter("nearest", "nearest")
   Map = STI("maps/tiletestmap.lua") -- Map exported from Tiled.
   Camera = require('libraries.camera')
   cam = Camera()
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
   cam:lookAt(Player.x, Player.y)

   -- Get our game window dimentions
   local w = love.graphics.getWidth()
   local h = love.graphics.getHeight()
   -- Left border
   if cam.x < w / 2 then
      cam.x = w / 2
   end
   -- Top border
   if cam.y < h / 2 then
      cam.y = h / 2
   end

   local mapW = Map.width * Map.tilewidth
   local mapH = Map.height * Map.tileheight

   -- Right border
   if cam.x > (mapW - w / 2) then
      cam.x = (mapW - w / 2)
   end
   -- Bottom border
   if cam.y > (mapH - h / 2) then
      cam.y = (mapH - h / 2)
   end
end

function love.draw()
   cam:attach()
   Map:drawLayer(Map.layers['GrassLayer'])
   Map:drawLayer(Map.layers['RoadTreeLayer'])
   Player.currentAnimation:draw(Player.spriteSheet, Player.x, Player.y, nil, 1, nil, 45, 49)
   cam:detach()
   love.graphics.print(tostring(Player.x) .. ' ' .. tostring(Player.y))
end
