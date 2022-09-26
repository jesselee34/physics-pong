local MapOneScene = {}
local ww
local wh
local map
local scale
local tx, ty = 0, 0
local sx, sy
local tick = 0.016
local timer = 0

-- Initialize
function MapOneScene.load ()
  scale = _G.store.Screen.getScale()
  sx, sy = scale, scale
  ww = _G.store.Screen.getWidth()
  wh = _G.store.Screen.getHeight()
end

-- Clean up
function MapOneScene.unload ()
  -- Free up some memory
  ww = nil
  wh = nil
  map = nil
end

-- Called once per frame
function MapOneScene.update (dt)
  -- Pin updates to 60 frames per second.
  timer = timer + dt
  if timer >= tick then
    timer = 0
    -- Do all the things
  end
end

-- Called once per frame
function MapOneScene.draw ()
  -- Store the current graphics settings
  love.graphics.push()
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.scale(scale, scale)

  love.graphics.setColor(0, 0, 0)
  
  love.graphics.rectangle()

  -- Set the graphics settings back
  love.graphics.pop()
end

return MapOneScene
