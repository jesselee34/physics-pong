local copy = require 'store._copy'

function Player (state)

  function getPlayer (index)
    if (index <= 0 or index > 10) then
      error('Player.getPlayer was called with ' .. index .. '. Index must be between 1 and 10.')
    end
    
    return copy(state.players['player' .. index])
  end

  function setPlayerGamepad (index, id)
    if (index <= 0 or index > 10) then
      error('Player.setPlayerGamepad was called with ' .. index .. '. Index must be between 1 and 10.')
    end
    
    state.players['player' .. index].gamepad = id
  end

  return {
    getPlayer = getPlayer,
    setPlayerGamepad = setPlayerGamepad,
  }
end

return Player
