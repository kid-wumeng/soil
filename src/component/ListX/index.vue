<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    props:
      'padding':
        type: String
        default: '0'


    # The reason why use the `render` function to generate the template
    # is inserting the separator between items.
    render: (createElement) ->
      items = @$slots['default'] ? []
      seps  = @$slots['sep']     ? []
      sep   = seps[0]

      children = []
      for item, i in items
        children.push item
        # Insert sep between items.
        if sep
          if i isnt items.length-1
            cloneSep = Soil.cloneVNode(sep)
            children.push(cloneSep)

      return createElement 'div', {class: 'soil-list-x'}, children


    mounted: ->
      @initPadding()


    updated: ->
      @initPadding()


    methods:
      initPadding: ->
        for node, i in @$el.childNodes
          if i isnt @$el.childNodes.length-1
            node.style.marginRight = @padding

</script>



<style lang="less">

  @import "../../asset/style/color";
  
  .soil-list-x{
    display: inline-flex;
    align-items: center;
    > *{
      flex: none;
    }
  }

</style>