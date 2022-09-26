function Keyboard (state)

  function addReleasedKey (key)
    state.keyboard.releasedKeys[key] = true
  end

  function clearReleasedKeys ()
    state.keyboard.releasedKeys = {}
  end

  function addPressedKey (key)
    state.keyboard.pressedKeys[key] = true
  end

  function clearPressedKeys ()
    state.keyboard.pressedKeys = {}
  end

  function keyPressed (key)
    if (state.keyboard.pressedKeys[key]) then
      return true
    end

    return false
  end
  
  function keyReleased (key)
    if (state.keyboard.releasedKeys[key]) then
      return true
    end

    return false
  end

  return {
    addReleasedKey = addReleasedKey,
    clearReleasedKeys = clearReleasedKeys,
    addPressedKey = addPressedKey,
    clearPressedKeys = clearPressedKeys,
    keyPressed = keyPressed,
    keyReleased = keyReleased
  }
end

return Keyboard
