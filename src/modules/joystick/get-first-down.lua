-- Given a set of joysticks, this function will return the first in the list
-- that is registering a hit on the button provided.

function getFirstDown (joysticks, button)
  for k, v in ipairs(joysticks) do
    if (v:isGamepadDown(button)) then
      return v
    end
  end

  return nil
end

return getFirstDown
