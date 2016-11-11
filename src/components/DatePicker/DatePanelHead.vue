<template lang="jade">

  .date-panel-head
    year-range-control(
      :year="year",
      @prev-year="$emit('prev-year')",
      @next-year="$emit('next-year')",
    )
    month-range-control(
      :month="month",
      @prev-month="$emit('prev-month')",
      @next-month="$emit('next-month')",
    )

</template>



<script lang="coffee">

  module.exports =

    components:
      'year-range-control':  require './YearRangeControl'
      'month-range-control': require './MonthRangeControl'

    props:
      'year':
        type: Number
        required: true
      'month':
        type: Number
        required: true

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .date-panel-head{
      display: flex;
      justify-content: space-between;
    }
  }

</style>