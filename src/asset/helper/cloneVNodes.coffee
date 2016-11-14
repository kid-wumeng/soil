module.exports = (vnodes) ->
  return vnodes.map (vnode) -> @cloneVNode(vnode)