<!--
  list-x
    item, sep, item, sep, ..., item
-->



<script lang="coffee">

  convertMode = (name, mode) ->
    # For example, ListX -> ['List', 'X']
    nameParts = name.match /[A-Z][a-z0-9]*/g
    switch mode
      when 'AaBb' then return name
      when 'aabb' then return nameParts.join('').toLowerCase()
      when 'AABB' then return nameParts.join('').toUpperCase()
      when 'Aa-Bb' then return nameParts.join('-')
      when 'aa-bb' then return nameParts.join('-').toLowerCase()
      when 'AA-BB' then return nameParts.join('-').toUpperCase()
      when 'Aa_Bb' then return nameParts.join('_')
      when 'aa_bb' then return nameParts.join('_').toLowerCase()
      when 'AA_BB' then return nameParts.join('_').toUpperCase()
      else throw "Mode [#{mode}] is not a pre-value"



  convertFormat = (name, format) ->
    return format.replace /\*/g, name

  $convertComponentName = (name, mode='aa-bb', format) ->
    name = convertMode name, mode
    return convertFormat name, format

  console.log $convertComponentName 'MainSide', null, 'soil-*'

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
        default: '8px'



    # The reason why use the `render` function to generate the template
    # is inserting the separator between the items.
    render: (createElement) ->
      if this._isExistSep()
        children = this._combineItemsAndSep()
      else
        children = this._getItems()
      attrs = class: 'soil-list-x'
      return createElement 'div', {attrs}, children



    mounted: ->
      this._handlePadding()



    updated: ->
      this._handlePadding()



    methods:

      _isExistSep: ->
        return this.$slots.sep isnt undefined


      _getItems: ->
        return this.$slots.default
        # VNode-Array


      _getSep: ->
        return this.$slots.sep[0]
        # VNode


      _combineItemsAndSep: ->
        nodes = []
        items = this._getItems()
        sep = this._getSep()
        last = items.length - 1
        for i in [0..last-1]
          nodes.push items[i]
          nodes.push sep
        nodes.push items[last]
        return nodes
        # VNode-Array - [ item-1, sep, item-2, sep, item-3, ..., item-n ]


      _handlePadding: ->
        children = this.$el.childNodes
        last = children.length-1
        for i in [0..last-1]
          children[i].style.marginRight = @padding

</script>



<style lang="less">

  .soil-list-x
  {
    background-color: #ccc;
    display: inline-flex;
    align-items: center;
  }

</style>