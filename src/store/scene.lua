local SCENE = require 'constants.scene' 

function Scene (state)
  -- Get the active scene
  function getActive ()
    return state.activeScene
  end

  -- Set the active scene
  function setActive (sceneId)
    if (sceneId == SCENE.SPLASH) then state.activeScene = SCENE.SPLASH
    elseif (sceneId == SCENE.MENU) then state.activeScene = SCENE.MENU
    elseif (sceneId == SCENE.MAP_ONE) then state.activeScene = SCENE.MAP_ONE
    else
      error('store.scene.setActive was called with ' .. sceneId .. 'That scene id is unknown.')
    end
  end

  return {
    getActive = getActive,
    setActive = setActive
  }
end

return Scene
