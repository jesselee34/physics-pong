local SCENE = require 'constants.scene'
local SplashScene = require 'scenes.splash'
local MenuScene = require 'scenes.menu'
local MapOneScene = require 'scenes.map-one'

local Scene = {}
local mapLoadedFlag = false

-- Gets called once every frame (love.update)
function Scene.update (dt)
  local activeScene = _G.store.Scene.getActive()

  -- Update the splash screen
  if (activeScene == SCENE.SPLASH) then
    SplashScene.update(dt)
  end

  -- Update the menu screen
  if (activeScene == SCENE.MENU) then
    MenuScene.update(dt)
  end

  -- Update the map screen
  if (activeScene == SCENE.MAP_ONE) then
    -- The map controller has some initialization that should only be called once
    if (mapLoadedFlag == false) then
      MapOneScene.load()
      mapLoadedFlag = true
    else
      MapOneScene.update(dt)
    end
  end

  -- Unload the Map
  if (mapLoaded == true and activeScene ~= SCENE.MAP_ONE) then
    MapOneScene.unload()
    mapLoaded = false
  end
end

-- Gets called once every frame (love.draw)
function Scene.draw ()
  local activeScene = _G.store.Scene.getActive()

  -- Draw the spash screen
  if (activeScene == SCENE.SPLASH) then
    SplashScene.draw()
  end

  -- Draw the menu screen
  if (activeScene == SCENE.MENU) then
    MenuScene.draw()
  end

  -- Draw the map screen
  if (activeScene == SCENE.MAP_ONE) then
    -- Only draw if the map has been loaded
    if (mapLoadedFlag == true) then
      MapOneScene.draw()
    end
  end
end

return Scene
