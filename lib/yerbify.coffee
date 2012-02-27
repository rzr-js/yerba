# apply RZR specific macros to the code
module.exports.yerbify = (code) ->

  {macros} = require './defineMacros'
  {walkAst} = require './walkAst'
  {parser, uglify} = require 'uglify-js'

  # get me an AST
  ast = parser.parse code

  # analyze AST
  ast = walkAst ast, (type, parts) ->

    # only interested in transforming function calls
    if type == 'call'
      [[_, fn], args] = parts

      # if FN matches any of our macros
      for name, transform of macros
        if fn == name
          # apply the transformation and parse the result into AST
          return parser.parse transform args

    # if it's not a match just reconstruct the node and return it
    [type, parts...]

  # generate code from the final AST
  return uglify.gen_code ast
