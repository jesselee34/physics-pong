local GUI = require 'constants.gui'

function Menu (state)
  function up ()
    if (state.menu.active == GUI.first()) then
      state.menu.active = GUI.last()
    else
      state.menu.active = state.menu.active - 1
    end
  end

  function down ()
    if (state.menu.active == GUI.last()) then
      state.menu.active = GUI.first()
    else
      state.menu.active = state.menu.active + 1
    end
  end

  function getActive ()
    return state.menu.active
  end
  
  return {
    up = up,
    down = down,
    getActive = getActive
  }
end

return Menu