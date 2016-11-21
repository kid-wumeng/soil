Vue = require 'vue'


module.exports = (vnode) ->
  cloned = vnode.context.$createElement()
  cloned.tag = vnode.tag
  cloned.data = vnode.data
  cloned.children = vnode.children
  cloned.text = vnode.text
  cloned.elm = vnode.elm
  cloned.ns = vnode.ns
  cloned.context = vnode.context
  cloned.componentOptions = vnode.componentOptions
  cloned.isStatic = vnode.isStatic;
  cloned.key = vnode.key;
  cloned.isCloned = true;
  return cloned