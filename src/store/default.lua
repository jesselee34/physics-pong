local Skin = require 'constants.skin'
local Gui = require 'constants.gui'
local Scene = require 'constants.scene'

return {
  activeScene = Scene.SPLASH,

  screen = {
    -- Native Resolution
    width = 960,
    height = 544,
    -- Default Scale (1440 x 816)
    scale = 1.5,
    fullscreen = true,
  },

  keyboard = {
    pressedKeys = {},
    releasedKeys = {}
  },

  -- example gamepad:
  -- {
  --   '0001' = {
  --     pressedButtons = {},
  --     releasedButtons = {}
  --   }  
  -- }

  gamepad = {},

  menu = {
    cooldown = 0,
    active = Gui.PLAY
  },

  players = {
    player1 = {
      tag = 'Player One',
      gamepad = nil,
      skin = Skin.DEFAULT,
    },
    
    player2 = {
      tag = 'Player Two',
      gamepad = nil,
      skin = Skin.DEFAULT,
    }
  }
}
