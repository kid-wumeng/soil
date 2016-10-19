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



n2br = (text) ->
  return text.replace /\n/g, '<br/>'


color = (value) ->
  switch value
    # red
    when 'soil-red'       then return '#FF4949'
    when 'soil-red-light' then return '#FF6D6D'
    when 'soil-red-dark'  then return '#CC3A3A'
    # green
    when 'soil-green'       then return '#13CE66'
    when 'soil-green-light' then return '#42D885'
    when 'soil-green-dark'  then return '#0FA552'
    # blue
    when 'soil-blue'       then return '#15A0FF'
    when 'soil-blue-light' then return '#44B3FF'
    when 'soil-blue-dark'  then return '#1180CC'
    # yellow
    when 'soil-yellow'       then return '#F7BA2A'
    when 'soil-yellow-light' then return '#F9C855'
    when 'soil-yellow-dark'  then return '#C69522'
    # gray
    when 'soil-gray-1'  then return '#F2F2F2'
    when 'soil-gray-2'  then return '#E6E6E6'
    when 'soil-gray-3'  then return '#D9D9D9'
    when 'soil-gray-4'  then return '#CCCCCC'
    when 'soil-gray-5'  then return '#BFBFBF'
    when 'soil-gray-6'  then return '#B3B3B3'
    when 'soil-gray-7'  then return '#999999'
    when 'soil-gray-8'  then return '#808080'
    when 'soil-gray-9'  then return '#666666'
    when 'soil-gray-10' then return '#4D4D4D'
    # black
    when 'soil-black'       then return '#1F2D3D'
    when 'soil-black-light' then return '#324057'
    # Standard CSS color-value
    else return value



exports.cloneVNode = cloneVNode
exports.cloneVNodes = cloneVNodes
exports.isEmailAddress = isEmailAddress
exports.n2br = n2br
exports.color = color