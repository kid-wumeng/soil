<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'soil-list-y': require '../ListY'
      'row': require './Row'


    props:
      'colCount':
        type: Number
        default: 3
      'paddingRow':
        type: String
        default: '0'
      'paddingCell':
        type: String
        default: '0'


    render: (createElement) ->
      items    = @$slots['default']  ? []
      rowSeps  = @$slots['sep-row']  ? []
      cellSeps = @$slots['sep-cell'] ? []

      rowSepTemplate  = createElement 'template', {slot: 'sep'}, rowSeps
      cellSepTemplate = createElement 'template', {slot: 'sep'}, cellSeps

      # Create all rows
      rows = []
      rowCount  = Math.ceil(items.length / @colCount)
      rowOption =
        props:
          'padding': @paddingCell

      for i in [0..rowCount-1]
        first = @colCount * i
        last  = @colCount * (i + 1) - 1
        row = createElement('row', rowOption, [items[first..last], cellSepTemplate])
        rows.push(row)

      # Create grid
      gridOption =
        class: 'soil-grid'
        props:
          'padding': @paddingRow

      return createElement('soil-list-y', gridOption, [rows, rowSepTemplate])

</script>