# Load macros for a RZR project

#! defining macros adds a precompile step to your application code
exports.macros = macros = require 'macrojs'

macros.define 'debug', (node) ->
  out = "console.log('Debug at line #{node.line}')\r\n"
  out += "console.trace()"
  return out

macros.define 'load', (pathSpec, node) ->
  {domainRoot} = require '../../project/services/projectRoot'

  {load} = (require 'modulate')(domainRoot: domainRoot)
  load(pathSpec)

#macros.add 'series'

#macros.add 'chain'

#macros.add 'parallel'

