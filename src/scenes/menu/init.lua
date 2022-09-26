local SCENE = require 'constants.scene'
local GUI = require 'constants.gui'
local getFirstDown = require 'modules.joystick.get-first-down'
local getFreeJoysticks = require 'modules.joystick.get-free-joysticks'

local MenuScene = {}
local playerOne
local joysticks
local activeItem

-- Gets called with every love.update
function MenuScene.update (dt)  
  activeItem =  _G.store.Menu.getActive()
  joysticks = love.joystick.getJoysticks()
  playerOne = _G.store.Player.getPlayer(1)
  
  if (
    _G.store.Keyboard.keyPressed('return') or
    _G.store.Gamepad.buttonReleased(playerOne.gamepad, 'a')
  ) then 
    -- Launch the map scene
    if (activeItem == GUI.PLAY) then
      _G.store.Scene.setActive(SCENE.MAP_ONE)
    end
  
    -- Quit
    if(activeItem == GUI.QUIT) then
      love.event.quit()
    end
  end
  
  if (_G.store.Keyboard.keyPressed('escape')) then
    love.event.quit()
  end

  -- Handle menu selection
  if (
    _G.store.Keyboard.keyReleased('up') or
    _G.store.Gamepad.buttonPressed(playerOne.gamepad, 'dpup')
  ) then
    _G.store.Menu.up()
  elseif (
    _G.store.Keyboard.keyReleased('down') or
    _G.store.Gamepad.buttonPressed(playerOne.gamepad, 'dpdown')
  ) then
    _G.store.Menu.down()
  end
end

-- Gets called with every love.draw
function MenuScene.draw ()
  local activeItem = _G.store.Menu.getActive()

  -- Store current graphics settings
  love.graphics.push()

  love.graphics.scale(3)
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setColor(255, 255, 255)
  love.graphics.setFont(_G.static.fonts.small)
  love.graphics.print('PLAY', 5, 140)
  love.graphics.print('QUIT', 5, 160)

  if (activeItem == GUI.PLAY) then
    -- Hightlight the play
    love.graphics.rectangle('fill', 2.5, 135, 100, 20)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print('PLAY', 5, 140)
  elseif (activeItem == GUI.QUIT) then
    -- Hightlight the QUIT
    love.graphics.rectangle('fill', 2.5, 155, 100, 20)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print('QUIT', 5, 160)
  end

  -- Set the graphics settings back to how they were
  love.graphics.pop()
end

return MenuScene
