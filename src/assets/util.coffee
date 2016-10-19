cloneVNode = (createElement, vnode) ->
  if vnode.componentOptions
    tag = vnode.componentOptions.tag
  else
    tag = vnode.tag
  { data, children } = vnode
  return createElement tag, data, children



cloneVNodes = (createElement, vnodes) ->
  return vnodes.map (vnode) -> cloneVNode(createElement, vnode)



isEmailAddress = (value) ->
  return /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test value



exports.cloneVNode = cloneVNode
exports.cloneVNodes = cloneVNodes
exports.isEmailAddress = isEmailAddress