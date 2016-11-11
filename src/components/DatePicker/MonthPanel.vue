<template lang="jade">

  .month-panel
    month-panel-head(
      :year="year",
      @prev-year="$emit('prev-year')",
      @next-year="$emit('next-year')",
    )
    month-panel-body(
      :month-labels="monthLabels",
      @pick="onPick"
    )

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'month-panel-head': require './MonthPanelHead'
      'month-panel-body': require './MonthPanelBody'

    props:
      'monthLabels':
        type: Array
        required: true
      'year':
        type: Number
        required: true

    methods:
      'onPick': (month) -> @$emit('pick', month)

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .month-panel-body{
      margin-top: 16px;
    }
  }

</style>