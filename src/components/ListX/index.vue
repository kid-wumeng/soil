<!--
  .soil-list-x
    slot, slot(sep), slot, slot(sep), ..., slot
-->



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
      if this._isExistSep()
        children = this._combineItemsAndSep()
      else
        children = this._getItems()
      return createElement 'div', {class: 'soil-list-x'}, children



    mounted: ->
      this._handlePadding()



    updated: ->
      this._handlePadding()



    methods:

      _isExistSep: ->
        return this.$slots.sep isnt undefined


      _getItems: ->
        return this.$slots.default


      _getSep: ->
        return this.$slots.sep[0]


      _combineItemsAndSep: ->
        nodes = []
        items = this._getItems()
        sep = this._getSep()
        len = items.length
        if len is 1
          # If one item,
          # nodes = [item]
          nodes = items
        else
          # If multiple items,
          # nodes = [item-1, sep, item-2, sep, ..., item-n]
          last = len - 1
          for i in [0..last-1]
            nodes.push items[i]
            nodes.push sep
          nodes.push items[last]
        return nodes


      _handlePadding: ->
        children = this.$el.childNodes
        len = children.length
        if len > 1
          last = len - 1
          for i in [0..last-1]
            children[i].style.marginRight = @padding
</script>



<style lang="less">
  .soil-list-x {
    display: flex;
    align-items: center;
  }
</style>