function Screen (state)
  function getWidth ()
    return state.screen.width
  end

  function getHeight ()
    return state.screen.height
  end

  function getScale ()
    return state.screen.scale
  end

  function getFullScreen ()
    return state.screen.fullScreen
  end
  
  return {
    getWidth = getWidth,
    getHeight = getHeight,
    getScale = getScale,
    getFullScreen = getFullScreen
  }
end

return Screen
