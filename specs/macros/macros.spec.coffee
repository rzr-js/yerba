require 'should'

# When I require macros
{macros} = require '../../domain/macros/services/defineMacros'

(->
  # And I eval load
  result = macros.process "load('foo.fooService')"

  # Then I should have access to a module
  result.should.include "require"
  result.should.include "foo/services/fooService"

  )()

(->
  # And I eval load
  result = macros.process """
  series(
    function(a, callback){a += 1; callback(a);},
    function(b, callback){b = b * 2; callback(b)},
    function(c, callback){c = c - 5; callback(c)},
    test
    );
  """

  # Then I should have access to a module
  result.should.include "series"

  )()
