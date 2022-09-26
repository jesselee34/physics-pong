local SCENE = require 'constants.scene'
local SplashScene = {}

local timer = 0

-- Gets called with every love.update
function SplashScene.update (dt)
  timer = timer + dt

  if (_G.store.Gamepad.anyReleases()) then
    local gp = _G.store.Gamepad.firstWithAnyReleases()
    
    -- Assign player one the firt gamepad with button inputs
    _G.store.Player.setPlayerGamepad(1, gp)
    _G.store.Scene.setActive(SCENE.MENU)
  end
  
  if (love.keyboard.isDown('escape')) then
    love.event.quit()
  end
end

-- Gets called with every love.draw
function SplashScene.draw ()
  local activeItem = _G.store.Menu.getActive()

  -- Store current graphics settings
  love.graphics.push()

  love.graphics.scale(3, 3)
  love.graphics.setBackgroundColor(255, 255, 255);
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(_G.static.fonts.large)
  love.graphics.print('GAME Title', 175, 90)

  -- Make the presse any text blink
  if (timer <= 0.5) then
    love.graphics.setFont(_G.static.fonts.medium)
    love.graphics.print('Press Any Button', 150, 120)
  end

  if (timer >= 1) then
    timer = 0
  end

  -- Set the graphics settings back
  love.graphics.pop()
end

return SplashScene