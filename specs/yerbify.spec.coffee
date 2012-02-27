require 'should'
{yerbify} = require '../lib/yerbify.coffee'

tests =
  "load('foo')" : 'require("foo")'
  "chain(fnA, fnB, fnC, fnTest)" : 'fnA.fill(fnB.fill(fnC.fill(fnTest)))'

for input, output of tests
  yerbify(input).should.equal output
