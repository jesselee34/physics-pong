local Screen = require 'store.screen'
local Scene = require 'store.scene'
local Player = require 'store.player'
local Menu = require 'store.menu'
local Map = require 'store.map'
local Keyboard = require 'store.keyboard'
local Gamepad = require 'store.gamepad'
local default = require 'store.default'
local copy = require 'store._copy'

function Store ()
  local state = nil
  state = copy(default)

  local store = {
    Screen = Screen(state),
    Scene = Scene(state),
    Player = Player(state),
    Menu = Menu(state),
    Map = Map(state),
    Keyboard = Keyboard(state),
    Gamepad = Gamepad(state)
  }

  return store
end

return Store