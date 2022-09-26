local copy = require 'store._copy'

describe('_copy', function ()
  it('should return a copy of a simple table', function () 
    local t = {
      foo = 'foo',
      bar = 'bar'
    }

    local actual = copy(t)

    -- Change some values on the original table
    t.foo = 'not foo'
    t.bar = 'not bar'

    assert.True(actual.foo == 'foo')
    assert.True(actual.bar == 'bar')
  end)

  it('should return a copy of a nested table', function () 
    local t = {
      foo = {
        foo = 'foo',
        bar = 'bar'
      }
    }

    local actual = copy(t)

    -- Change some values on the original table
    t.foo = 'not foo'

    assert.True(actual.foo.foo == 'foo')
    assert.True(actual.foo.bar == 'bar')
  end)
end)