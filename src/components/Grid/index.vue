<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:
      'colCount':
        type: Number
        default: 3
      'matchParent':
        type: Boolean
        default: false


    computed:
      'classObject': ->
        'soil-grid': true
        '-match-parent': @matchParent
        '-match-content': not @matchParent


    render: (createElement) ->
      createCell  = (item) => createElement 'div', {class: 'cell'}, [item]
      createCells = (items) => items.map createCell
      createRow   = (items) => createElement 'div', {class: 'row'}, createCells(items)
      createRows  = (allItems) =>
        rows = []
        rowCount = Math.ceil(allItems.length / @colCount)
        for i in [0..rowCount-1]
          first = @colCount * i
          last  = @colCount * (i + 1) - 1
          items = []
          for j in [first..last]
            items.push allItems[j]
          rows.push createRow(items)
        return rows
      # ---
      allItems = this.$slots.default
      return createElement 'div', {class: @classObject}, createRows(allItems)


    mounted: ->
      cells  = this.$el.querySelectorAll '.cell'
      width  = cells[0].offsetWidth
      height = cells[0].offsetHeight
      for cell in cells
        cell.style.width  = "#{width}px"
        cell.style.height = "#{height}px"

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-grid.-match-content {
    display: inline-flex;
    flex-direction: column;
    > .row {
      display: flex;
      > .cell {
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
      }
    }
  }

  .soil-grid.-match-parent {
    display: flex;
    flex-direction: column;
    > .row {
      display: flex;
      justify-content: space-between;
      > .cell {
        flex: auto;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
      }
    }
  }

</style>