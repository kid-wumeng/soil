cloneVNode = (createElement, vnode) ->
  { data } = vnode
  { tag, children } = vnode.componentOptions
  return createElement tag, data, children



cloneVNodes = (createElement, vnodes) ->
  return vnodes.map (vnode) -> cloneVNode(createElement, vnode)



exports.cloneVNode = cloneVNode
exports.cloneVNodes = cloneVNodes