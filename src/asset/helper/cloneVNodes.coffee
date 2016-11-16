cloneVNode = require './cloneVNode.coffee'


module.exports = (vnodes) ->
  return vnodes.map (vnode) -> cloneVNode(vnode)