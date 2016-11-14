<script lang="coffee">

  module.exports =


    components:
      'soil-list-y': require '../ListY'
      'row': require './Row'


    props:
      'cols':
        type: Number
        default: 3
      'paddingRow':
        type: String
        default: '0'
      'paddingCell':
        type: String
        default: '0'
      # @TODO To support `match-parent` prop


    render: (createElement) ->
      items    = @$slots['default']  ? []
      rowSeps  = @$slots['sep-row']  ? []
      cellSeps = @$slots['sep-cell'] ? []

      rowSepTemplate  = createElement 'template', {slot: 'sep'}, rowSeps
      cellSepTemplate = createElement 'template', {slot: 'sep'}, cellSeps

      # Create all rows
      colCount = @cols
      rowCount = Math.ceil(items.length/colCount)
      rows = []
      rowOption =
        props:
          'padding': @paddingCell

      for i in [0..rowCount-1]
        first = colCount * i
        last  = colCount * (i + 1) - 1
        itemsInRow = items[first..last]
        row = createElement 'row', rowOption, [itemsInRow, cellSepTemplate]
        rows.push(row)

      # Create grid
      gridOption =
        class: 'soil-grid'
        props:
          'padding': @paddingRow

      return createElement 'soil-list-y', gridOption, [rows, rowSepTemplate]

</script>