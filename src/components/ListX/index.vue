<script lang="coffee">
  module.exports =

    props:

      # The padding between the items.
      # Suppose there are 3 items and the `padding` is 8,
      # if sep is exist:
      #   item-1 |8| sep |8| item-2 |8| sep |8| item-3
      # else
      #   item-1 |8| item-2 |8| item-3

      'padding':
        type: String
        default: '4px'



    # The reason why use the `render` function to generate the template
    # is inserting the separator between the items.

    render: (createElement) ->

      _countItems = =>
        return this.$slots.default.length

      _createItem = (item) =>
        return createElement 'div', {class: 'item'}, [item]

      _createItems = =>
        return this.$slots.default.map _createItem

      _existSep = =>
        return this.$slots.sep isnt undefined

      _createSep = =>
        return createElement 'div', {class: 'sep'}, this.$slots.sep

      _combine = (items, sep) =>
        nodes = []
        last = items.length - 1
        for i in [0..last-1]
          nodes.push items[i]
          nodes.push sep
        nodes.push items[last]
        return nodes

      items = _createItems()
      if !_existSep() or _countItems() is 1
        children = items
      else
        sep = _createSep()
        children = _combine(items, sep)
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



<style lang="less">
  .soil-list-x {
    display: flex;
    align-items: center;
  }
</style>