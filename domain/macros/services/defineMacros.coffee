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

macros.define 'chain', (fns..., node) ->
  require "sugar"

  chain = (fns) ->
    # from(1) === rest()
    if fns.from(1).length > 0

      # fill performs currying, returning a modified function with the first arg pre-supplied
      "#{fns.first()}.fill(#{chain fns.from(1)})"
    else
      fns.first()

  chain(fns).toString() + ';'

#macros.define 'run'

