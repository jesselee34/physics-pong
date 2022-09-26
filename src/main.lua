-- Make inspect available glogally
inspect = require 'modules.inspect'

local Store = require 'store'
local Scene = require 'modules.scene'

-- Game Static asset store
_G.static = {
  fonts = {
    large = nil
  },
  sounds = {
    jump = nil
  }
}

-- Game Store
_G.store = nil

-- Called once on start up
function love.load ()
  -- Load Fonts
  _G.static.fonts.large = love.graphics.newFont('assets/fonts/font.ttf', 24)
  _G.static.fonts.medium = love.graphics.newFont('assets/fonts/font.ttf', 18)
  _G.static.fonts.small = love.graphics.newFont('assets/fonts/font.ttf', 12)
  _G.static.fonts.large:setFilter( "nearest", "nearest" )
  _G.static.fonts.medium:setFilter( "nearest", "nearest" )
  _G.static.fonts.small:setFilter( "nearest", "nearest" )

  -- Load Sounds
  _G.static.sounds.jump = love.audio.newSource('assets/sounds/jump.wav', 'static')
  
  -- Load the gamepad mapping database
  love.joystick.loadGamepadMappings('assets/gamepad/gamecontrollerdb.txt')

  -- Initialize store
  _G.store = Store()

  -- Set window config
  love.window.setMode(
    _G.store.Screen.getWidth() * _G.store.Screen.getScale(),
    _G.store.Screen.getHeight() * _G.store.Screen.getScale(),

    {
      fullscreen = _G.store.Screen.getFullScreen()
    }
  )
end

-- Called once per frame
function love.update (dt)
  -- debugging
  -- if dt < 1/10 then
  --   love.timer.sleep(1/10 - dt)
  -- end
  Scene.update(dt)

  -- Clear key presses and releases for this frame
  _G.store.Keyboard.clearPressedKeys()
  _G.store.Keyboard.clearReleasedKeys()

  -- Clear joystick presses and releases for this frame
  _G.store.Gamepad.clearPressedButtons()
  _G.store.Gamepad.clearReleasedButtons()
end

-- Called once per frame
function love.draw ()
  Scene.draw()
end

-- Called every time a keyboard input is registered
function love.keypressed (key)
  _G.store.Keyboard.addPressedKey(key)
end

-- Called every time a keyboard key is released
function love.keyreleased (key)
  _G.store.Keyboard.addReleasedKey(key)
end

-- Called every time a gamepad button is pressed
function love.gamepadpressed (joystick, button)
  _G.store.Gamepad.addPressedButton(joystick:getID(), button)
end

-- Called every time a gamepad button is released
function love.gamepadreleased (joystick, button)
  _G.store.Gamepad.addReleasedButton(joystick:getID(), button)
end