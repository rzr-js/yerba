require 'sugar'
Object.extend()

# walk AST, applying transform function
module.exports.walkAst = walkAst = (ast, transform) ->

  if ast.isArray()
    [first, rest...] = ast

    if first.isString()
      rest = (walkAst node, transform for node in rest)
      return transform first, rest

    else
      ast = (walkAst node, transform for node in ast)

  else
    return ast
