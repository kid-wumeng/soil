<template lang="jade">

  div.panel.month-panel(v-if="open")

    div.head
      div.range-control
        soil-icon(
          name="arrow-left",
          @click="year--"
        )
        div.label.-enabled(
          @click="onSwitchYearPanel"
        ) {{ label }}
        soil-icon(
          name="arrow-right",
          @click="year++"
        )

    soil-grid.body(match-parent, :col-count="4")
      div.point.-enabled(
        v-for="month in 12",
        @click="onSelectMonth(month)"
      ) {{ monthLabels[month-1] }}

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:
      'monthLabels':
        type: Array
        required: true

    data: ->
      'open': false
      'year': null

    computed:
      'label': -> "#{@year}"

    methods:
      'show': (@year) -> @open = true
      'hide':         -> @open = false
      'onSwitchYearPanel':     -> this.$emit 'switch-year-panel', @year
      'onSelectMonth': (month) -> this.$emit 'select-month', @year, month

</script>



<style lang="less">

  @import "../../assets/styles/color";

</style>