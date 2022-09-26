-- Given a list of ojects with an id property, and an id
-- this function will return true if the id matches any in the list
function _hasThisId (list, id)
  for k, v in pairs(list) do
    if (v == id) then
      return true
    end
  end

  return false
end

-- Given a set of love2d joysticks, and a set of ids
-- this function will return a list of love2d joystics filtered to exclude any matching ids
function getFreeJoysticks (joysticks, ids)
  local result = {}
  
  for k, v in ipairs(joysticks) do
    if (_hasThisId(ids, v:getID()) == false) then
      table.insert(result, v)
    end
  end

  return result
end

return getFreeJoysticks
