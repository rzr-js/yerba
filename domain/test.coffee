{dirname, existsSync} = require 'path'
getRoot = -> (dirname(dir) for dir in require.main.paths when existsSync(dir))[0]
console.log getRoot()
