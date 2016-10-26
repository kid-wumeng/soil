<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

      'padding':
        type: String
        default: '4px'



    # The reason why use the `render` function to generate the template
    # is inserting the separator between the items.

    # @TODO Recode the struct
    render: (createElement) ->

      _countItems = =>
        return this.$slots.default.length

      _createItem = (item) =>
        return createElement 'div', {class: 'item'}, [item]

      _createItems = =>
        items = this.$slots.default ? []
        return items.map _createItem

      _existSep = =>
        return this.$slots.sep isnt undefined

      _createSep = =>
        sep = util.cloneVNodes createElement, this.$slots.sep
        return createElement 'div', {class: 'sep'}, sep

      _combineWithSep = (items) =>
        nodes = []
        last = items.length - 1
        for i in [0..last-1]
          nodes.push items[i]
          nodes.push _createSep()
        nodes.push items[last]
        return nodes

      items = _createItems()
      if not this.$slots.default
        children = []
      else if !_existSep() or _countItems() is 1
        children = items
      else
        sep = _createSep()
        children = _combineWithSep items
      return createElement 'div', {class: 'soil-list-x'}, children



    mounted: ->
      this._handlePadding()



    updated: ->
      this._handlePadding()



    methods:

      _handlePadding: ->
        nodes = this.$el.childNodes
        len = nodes.length
        if len > 1
          last = len - 1
          for i in [0..last-1]
            nodes[i].style.marginRight = @padding

</script>



<style lang="less" scoped>

  .soil-list-x {
    display: flex;
    align-items: stretch;
  }

  .soil-list-x > .item,
  .soil-list-x > .sep {
    display: flex;
    align-items: center;
  }

</style>