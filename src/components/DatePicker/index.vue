<template lang="jade">

  .soil-date-picker
    year-panel(
      ref="yearPanel",
      @select-year="onSelectYear"
    )
    month-panel(
      ref="monthPanel",
      @select-month="onSelectMonth"
    )
    date-panel(
      ref="datePanel",
      @select-date="onSelectDate"
    )
    {{year}} 年 {{month}} 月 {{date}} 日

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'year-panel':  require './YearPanel'
      'month-panel': require './MonthPanel'
      'date-panel':  require './DatePanel'

    props:
      'initDecade':
        type: Number
        default: 2000

    data: ->
      'year':  null
      'month': null
      'date':  null

    mounted: ->
      this.$refs.yearPanel.show(@initDecade)

    methods:
      'onSelectYear': (year) ->
        @year = year
        this.$refs.yearPanel.hide()
        this.$refs.monthPanel.show(year)
      'onSelectMonth': (year, month) ->
        @year  = year
        @month = month
        this.$refs.monthPanel.hide()
        this.$refs.datePanel.show(year, month)
      'onSelectDate': (year, month, date) ->
        @year  = year
        @month = month
        @date  = date
        this.$refs.datePanel.hide()

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker {
    width: 300px;
  }

</style>