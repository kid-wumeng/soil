cloneVNode = (createElement, vnode) ->
  if vnode.componentOptions
    tag = vnode.componentOptions.tag
  else
    tag = vnode.tag
  { data, children } = vnode
  return createElement tag, data, children



cloneVNodes = (createElement, vnodes) ->
  return vnodes.map (vnode) -> cloneVNode(createElement, vnode)



exports.cloneVNode = cloneVNode
exports.cloneVNodes = cloneVNodes