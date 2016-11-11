<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    # The reason why use the `render` function to generate the template
    # is inserting the separator between cells.
    render: (createElement) ->
      items = @$slots['default'] ? []
      seps  = @$slots['sep']     ? []
      sep   = seps[0]

      cells = items.map (item) -> createElement 'div', {class: 'cell'}, [item]

      children = []
      for cell, i in cells
        children.push cell
        # Insert sep between cells.
        if sep
          if i isnt cells.length-1
            cloneSep = util.cloneVNode(sep)
            children.push(cloneSep)

      return createElement 'div', {class: 'soil-bar-x'}, children

</script>



<style lang="less">

  .soil-bar-x{
    display: flex;
    align-items: center;
    >.cell{
      align-self: stretch;
      flex-shrink: 1;
      flex-basis: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    >:not(.cell){
      flex: none;
    }
  }

</style>