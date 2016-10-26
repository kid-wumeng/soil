<template lang="jade">

  div.panel.year-panel(v-if="open")

    div.head
      div.range-control
        soil-icon.prev(
          name="arrow-left",
          @click="yearStart -= 10"
        )
        div.label.-disabled {{ label }}
        soil-icon.next(
          name="arrow-right",
          @click="yearStart += 10"
        )
        
    soil-grid.body(match-parent, :col-count="4")
      div.point.-enabled(
        v-for="year in years",
        @click="onSelectYear(year)"
      ) {{ year }}

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    data: ->
      'open': false
      'yearStart': null

    computed:
      'label': -> "#{@yearStart} - #{@yearStart+9}"
      'years': -> [@yearStart..@yearStart+9]

    methods:
      'show': (decade) ->
        @yearStart = parseInt(decade / 10) * 10
        @open = true
      'hide': ->
        @open = false
      'onSelectYear': (year) ->
        this.$emit 'select-year', year

</script>


<style lang="less">

  @import "../../assets/styles/color";

</style>