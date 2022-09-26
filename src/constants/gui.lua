local Gui = {}

Gui.PLAY = 0
Gui.QUIT = 1

function Gui.first ()
  return Gui.PLAY
end

function Gui.last ()
  return Gui.QUIT
end

return Gui
