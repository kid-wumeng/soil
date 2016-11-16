<template lang="jade">

  .date-panel-head
    year-range-control(
      :year="year",
      @prev-year="$emit('prev-year')",
      @next-year="$emit('next-year')",
      @switch-year-panel="$emit('switch-year-panel')"
    )
    month-range-control(
      :month-labels="monthLabels",
      :month="month",
      @prev-month="$emit('prev-month')",
      @next-month="$emit('next-month')",
      @switch-month-panel="$emit('switch-month-panel')"
    )

</template>



<script lang="coffee">

  module.exports =

    components:
      'year-range-control':  require './YearRangeControl'
      'month-range-control': require './MonthRangeControl'

    props:
      'monthLabels':
        type: Array
        required: true
      'year':
        type: Number
        required: true
      'month':
        type: Number
        required: true

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-date-picker{
    .date-panel-head{
      display: flex;
      justify-content: space-between;
    }
  }

</style>