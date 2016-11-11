<template lang="jade">

  .soil-date-picker

    year-panel(
      v-show="yearPanelOpen",
      :decade="decade",
      @prev-decade="decade -= 10",
      @next-decade="decade += 10",
      @pick="onPickYear"
    )

    month-panel(
      v-show="monthPanelOpen",
      :month-labels="monthLabels",
      :year="year",
      @prev-year="year--",
      @next-year="year++",
      @switch-year-panel="onSwitchYearPanel",
      @pick="onPickMonth"
    )

    date-panel(
      v-show="datePanelOpen",
      :month-labels="monthLabels",
      :day-labels="dayLabels",
      :year="year",
      :month="month",
      @prev-year="year--",
      @next-year="year++",
      @prev-month="onPrevMonth",
      @next-month="onNextMonth",
      @switch-year-panel="onSwitchYearPanel",
      @switch-month-panel="onSwitchMonthPanel",
      @pick="onPickDate"
    )

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'year-panel':  require './YearPanel'
      'month-panel': require './MonthPanel'
      'date-panel':  require './DatePanel'


    props:
      'value':
        type: Object
        default: -> {}
      'initYear':
        type: Number
        default: 2000
      'monthLabels':
        type: Array
        default: -> [ 'Jan' , 'Feb', 'Mar', 'Apr'
                      'May' , 'Jun', 'Jul', 'Aug'
                      'Sept', 'Oct', 'Nov', 'Dec' ]
      'dayLabels':
        type: Array
        default: -> ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']

      # @TODO To support the `month-from-0` prop


    data: ->
      'decade': parseInt(@initYear / 10) * 10
      'year':   @initYear
      'month':  1
      'date':   1
      'yearPanelOpen':  true
      'monthPanelOpen': false
      'datePanelOpen':  false


    methods:
      'onPrevMonth': -> if @month > 1  then @month-- else @year-- and @month = 12
      'onNextMonth': -> if @month < 12 then @month++ else @year++ and @month = 1
      'onSwitchYearPanel': ->
        @decade = parseInt(@year / 10) * 10
        @monthPanelOpen = false
        @datePanelOpen  = false
        @yearPanelOpen  = true
      'onSwitchMonthPanel': ->
        @yearPanelOpen  = false
        @datePanelOpen  = false
        @monthPanelOpen = true
      'onPickYear': (year) ->
        @year = year
        @yearPanelOpen  = false
        @monthPanelOpen = true
      'onPickMonth': (month) ->
        @month = month
        @monthPanelOpen = false
        @datePanelOpen  = true
      'onPickDate': (date) ->
        @date = date
        @$emit('input', {
          year:  @year
          month: @month
          date:  @date
        })

</script>



<style lang="less">

  .soil-date-picker{
    width: 280px;
  }

</style>