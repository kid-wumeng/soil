Vue = require 'vue'


module.exports = (vnode) ->
  if vnode.componentOptions
    tag = vnode.componentOptions.tag
    propsData = vnode.componentOptions.propsData
  else
    tag = vnode.tag
    propsData = {}

  data = vnode.data
  data.props = merge data.props, propsData

  children = vnode.children
  if children
    children = cloneVNodes children

  vm = new Vue
  return vm.$createElement tag, data, children