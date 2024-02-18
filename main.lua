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
   local windowWidth = love.graphics.getWidth()
   local windowHeight = love.graphics.getHeight()
   local mapW = Map.width * Map.tilewidth
   local mapH = Map.height * Map.tileheight -- Left border
   if cam.x < windowWidth / 2 then
      cam.x = windowWidth / 2
   end
   -- Top border
   if cam.y < windowHeight / 2 then
      cam.y = windowHeight / 2
   end


   if Player.x < 0 then
      Player.x = 0
   end
   if Player.y < 0 then
      Player.y = 0
   end
   if Player.x > mapW then
      Player.x = mapW
   end
   if Player.y > mapH then
      Player.y = mapH
   end
   -- Camera boundaries
   -- Right border
   if cam.x > (mapW - windowWidth / 2) then
      cam.x = (mapW - windowWidth / 2)
   end
   -- Bottom border
   if cam.y > (mapH - windowHeight / 2) then
      cam.y = (mapH - windowHeight / 2)
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
