# find the root for whatever project you're working in
{dirname, existsSync, join} = require 'path'
getRoot = -> (dirname(dir) for dir in require.main.paths when existsSync(dir))[0]
getDomainRoot = -> join getRoot(), 'domain'

exports.projectRoot = getRoot()
exports.domainRoot = getDomainRoot()
