require 'should'

# When I require macros
{macros} = require '../macros'

# And I eval load
result = macros.process "load('foo.fooService')"

# Then I should have access to a module
result.should.include "require"
result.should.include "foo/services/fooService"

