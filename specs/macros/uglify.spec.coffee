require 'should'

# Given I require macro definitions
require '../../domain/macros/services/uglifyMacros'

# When I require a yerba file
result = require './test'

# I should see chain evaluated to callbacks
#result.should.equal 5
