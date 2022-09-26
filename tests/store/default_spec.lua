local default = require 'store.default'
local Scene = require 'constants.scene'

describe('store.default', function ()
  it('Should load without errors', function ()
    assert.True(default.activeScene == Scene.SPLASH)
  end)
end)