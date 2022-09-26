function Gamepad (state)

  function createGamepad ()
    return {
      releasedButtons = {},
      pressedButtons = {}
    }
  end

  function addReleasedButton (id, button)
    if (state.gamepad[id] == nil) then
      state.gamepad[id] = createGamepad()
    end
    
    state.gamepad[id].releasedButtons[button] = true
  end

  function clearReleasedButtons ()
    for k, v in pairs(state.gamepad) do
      state.gamepad[k].releasedButtons = {}
    end
  end

  function addPressedButton (id, button)
    if (state.gamepad[id] == nil) then
      state.gamepad[id] = createGamepad()
    end

    state.gamepad[id].pressedButtons[button] = true
  end

  function clearPressedButtons ()
    for k, v in pairs(state.gamepad) do
      state.gamepad[k].pressedButtons = {}
    end
  end

  function buttonPressed (id, button)
    if (state.gamepad[id] ~= nil and state.gamepad[id].pressedButtons[button]) then
      return true
    end

    return false
  end
  
  function buttonReleased (id, button)
    if (state.gamepad[id] ~= nil and state.gamepad[id].releasedButtons[button]) then
      return true
    end

    return false
  end

  function getIds ()
    local result = {}
    for k, v in pairs(state.gamepad) do
      table.insert(result, k)
    end
    return result
  end

  function anyReleases ()
    for k, v in pairs(state.gamepad) do
      if (next(v.releasedButtons) ~= nil) then
        return true
      end
    end

    return false
  end

  function firstWithAnyReleases ()
    for k, v in pairs(state.gamepad) do
      if (next(v.releasedButtons) ~= nil) then
        return k
      end
    end

    return nil
  end

  function _printGamepad ()
    print(inspect(state.gamepad))
  end

  return {
    addReleasedButton = addReleasedButton,
    clearReleasedButtons = clearReleasedButtons,
    addPressedButton = addPressedButton,
    clearPressedButtons = clearPressedButtons,
    buttonPressed = buttonPressed,
    buttonReleased = buttonReleased,
    getIds = getIds,
    anyReleases = anyReleases,
    firstWithAnyReleases = firstWithAnyReleases,
    _printGamepad = _printGamepad
  }
end

return Gamepad
