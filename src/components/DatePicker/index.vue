<template lang="jade">

  .soil-date-picker
    year-panel(
      ref="yearPanel",
      :decade="decade",
      @prev-decade="decade -= 10",
      @next-decade="decade += 10",
      @pick="onPickYear"
    )
    month-panel(
      ref="monthPanel",
      :month-labels="monthLabels",
      :year="year",
      @prev-year="year--",
      @next-year="year++",
      @pick="onPickMonth"
    )
    date-panel(
      ref="datePanel",
      :month-labels="monthLabels",
      :day-labels="dayLabels",
      :year="year",
      :month="month",
      @prev-year="year--",
      @next-year="year++",
      @prev-month="onPrevMonth",
      @next-month="onNextMonth",
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
      'initDecade':
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


    data: ->
      'decade': parseInt(@initDecade / 10) * 10
      'year':  @initDecade
      'month': 1
      'date':  null


    mounted: ->
      # this.$refs.yearPanel.show(@decade)


    methods:
      'onPrevMonth': -> if @month > 1  then @month-- else @year-- and @month = 12
      'onNextMonth': -> if @month < 12 then @month++ else @year++ and @month = 1
      'onPickYear': (year) ->
        console.log year
      'onPickMonth': (month) ->
        console.log month
      'onPickDate': (date) ->
        console.log date
      'onSwitchYearPanel': (year) ->
        this.$refs.monthPanel.hide()
        this.$refs.datePanel.hide()
        this.$refs.yearPanel.show(year)
      'onSwitchMonthPanel': (year) ->
        this.$refs.yearPanel.hide()
        this.$refs.datePanel.hide()
        this.$refs.monthPanel.show(year)
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
        # @TODO To support that month from 0
        this.$emit 'input', { year, month, date }

</script>



<style lang="less">

  @import "../../assets/styles/color";

  @panel-width: 240px;
  @panel-height: 300px;
  @head-height: 56px;

  .soil-date-picker{
    display: inline-block;

    .panel{
      .head{ height: @head-height }
      .body{ height: @panel-height - @head-height }
    }

    .range-control{
      height: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      .soil-icon{
        font-size: 16px;
        color: @soil-black-light;
        cursor: pointer;
      }
      .label{
        font-size: 14px;
        &.-enabled{
          color: @soil-black-light;
          cursor: pointer;
        }
        &.-disabled{
          color: @soil-gray-3;
          cursor: not-allowed;
        }
      }
    }

    .point{
      font-weight: normal;
      font-size: 12px;
      &.-enabled{
        color: @soil-black-light;
        cursor: pointer;
        &:hover{ background-color: @soil-gray-1 }
      }
      &.-disabled{
        color: @soil-gray-3;
        cursor: not-allowed;
      }
    }
  }

</style>