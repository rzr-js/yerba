require 'should'

# Load macros for a RZR project
module.exports.macros =
  load: (args) ->
    [[argType, loadSpec]] = args

    {join} = require 'path'
    {projectRoot, domainRoot} = require 'rzr-nav'
    getModulePath = require join(projectRoot, 'node_modules/modulate/domain/services/getModulePath')

    path = getModulePath(domainRoot, loadSpec)
    "require('#{ path }.js');"

  chain: (args) ->
    chainFns = (args) ->
      [[_, fn], rest...] = args
      if rest.isEmpty() then fn else "#{fn}.fill(#{chainFns rest})"

    chainFns args

  #run: (args) ->

