local copy = require 'store._copy'
local default = require 'store.default'
local Player = require 'store.player'

describe('Store.Player', function ()
  it('getPlayer: Should return the player given an index between 1 and 10', function () 
    local state = copy(default)
    local player = Player(state)

    state.players.player1.tag = 'Hello'

    local actual = player.getPlayer(1)

    assert.True(actual.tag == 'Hello')
  end)

  it('getPlayer: Should should throw if the index provided is not between 1 and 10.', function () 
    local state = copy(default)
    local player = Player(state)
    
    assert.has_error(function () player.getPlayer(11) end, 'Store.getPlayer was called with 11. Index must be between 1 and 10.')
  end)
end)