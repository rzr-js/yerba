coffee = require 'coffee-script'
macros = require 'macros'

macros.register ".yerba",
  pre: (text) ->
    coffee.compile text

  ast: (ast) ->
    num = 0
    burrito = require "burrito"
    util = require 'util'

    str = burrito ast, (node) ->
      console.log "#{num}: #{util.inspect node.node}" if node.node[0].name == 'call' && node.node[0].start.value == 'chain'
      num += 1
      if node.node[0].name == 'call' && node.node[0].start.value == 'chain'
        node.wrap "foo%s"

    console.log str
    burrito.parse str



