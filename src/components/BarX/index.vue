<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    render: (createElement) ->

      _createBar = =>
        itemLayer = _createItemLayer()
        return createElement 'div', {class: 'soil-bar-x'}, [itemLayer]

      _createBarWithSep = =>
        itemLayer = _createItemLayer()
        sepLayer = _createSepLayer()
        return createElement 'div', {class: 'soil-bar-x'}, [itemLayer, sepLayer]

      _countItems = =>
        return this.$slots.default.length

      _createItemLayer = =>
        return createElement 'div', {class: 'item-layer'}, _createItemCells()

      _createItemCells = =>
        rawItems = this.$slots.default ? []
        return rawItems.map _createItemCell

      _createItemCell = (rawItem) =>
        return createElement 'div', {class: 'item-cell'}, [_createItem(rawItem)]

      _createItem = (rawItem) =>
        return createElement 'div', {class: 'item'}, [rawItem]

      _existSep = =>
        return this.$slots.sep isnt undefined

      _createSepLayer = =>
        return createElement 'div', {class: 'sep-layer'}, _createSepCells()

      _createSepCells = =>
        count = _countItems() - 1
        return [1..count].map _createSepCell

      _createSepCell = (_, i) =>
        sep = _createSep()
        n = _countItems()
        width = 2 / n * 100 + '%'
        left  = i / n * 100 + '%'
        style = {width, left}
        return createElement 'div', {class: 'sep-cell', style}, [sep]

      _createSep = =>
        rawSepGroup = this.$slots.sep
        return createElement 'div', {class: 'sep'}, util.cloneVNodes(createElement, rawSepGroup)

      return if _existSep() then _createBarWithSep() else _createBar()

</script>



<style lang="less">

  @import "../../assets/common";

  .soil-bar-x {
    position: relative;
  }

  .soil-bar-x > .item-layer {
    display: table;
    width: 100%;
    height: 100%;
    table-layout: fixed;
  }

  .soil-bar-x > .item-layer > .item-cell {
    display: table-cell;
    vertical-align: middle;
  }

  .soil-bar-x > .item-layer > .item-cell > .item {
    display: flex;
    justify-content: center;
  }

  .soil-bar-x > .sep-layer {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
  }

  .soil-bar-x > .sep-layer > .sep-cell {
    position: absolute;
    display: flex;
    justify-content: center;
    height: 100%;
  }

  .soil-bar-x > .sep-layer > .sep-cell > .sep {
    height: 100%;
    display: flex;
    align-items: center;
  }

</style>