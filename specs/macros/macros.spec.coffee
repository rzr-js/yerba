require 'should'

# When I require macros
{macros} = require '../../domain/macros/services/defineMacros'

(->
  # And I process load
  result = macros.process "load('foo.fooService')"

  # Then I should have access to a module
  result.should.include "require"
  result.should.include "foo/services/fooService"

  )()

(->
  # And I have some functions

  fnA = (cb, a) ->
    a += 1
    cb(a)
  fnB = (cb, b) ->
    b = b * 2
    cb(b)
  fnC = (cb, c) ->
    c = c - 5
    cb(c)

  fnTest = (val) ->
    val.should.equal 7

  # And I process chain
  result = macros.process """
  foo = chain(
    fnA,
    fnB,
    fnC,
    fnTest
    )(5);
  """

  # Then it should chain the functions
  result.should.not.include "chain"

  result.should.equal """
    fnA.fill(fnB.fill(fnC.fill(fnTest)));
  """

  # The curry chain should return a function that accepts a single arg.
  # Calling that function should pass the argument through fnA, fnB, and fnC,
  # and finally test the result in fnTest.
  eval result

)()
