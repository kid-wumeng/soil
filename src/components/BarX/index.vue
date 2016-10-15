<script lang="coffee">
  module.exports =

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
      return createElement 'div', {class: 'soil-bar-x'}, children
</script>



<style lang="less">
  .soil-bar-x
  {
    display: flex;
    align-items: center;
  }

  .soil-bar-x > .item
  {
    flex-grow: 1;
    display: flex;
    justify-content: center;
  }
</style>