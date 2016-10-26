<template lang="jade">

  .soil-date-picker
    year-panel(
      ref="yearPanel",
      @select-year="onSelectYear"
    )
    month-panel(
      ref="monthPanel",
      :month-labels="monthLabels",
      @switch-year-panel="onSwitchYearPanel",
      @select-month="onSelectMonth"
    )
    date-panel(
      ref="datePanel",
      :month-labels="monthLabels",
      :day-labels="dayLabels",
      @switch-year-panel="onSwitchYearPanel",
      @switch-month-panel="onSwitchMonthPanel",
      @select-date="onSelectDate"
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
      'year':  null
      'month': null
      'date':  null


    mounted: ->
      this.$refs.yearPanel.show(@initDecade)


    methods:
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
        this.$refs.datePanel.hide()

</script>



<style lang="less">

  @import "../../assets/styles/color";

  @panel-width: 300px;
  @panel-height: 300px;
  @head-height: 56px;

  .soil-date-picker{
    display: inline-block;

    .panel{
      width: @panel-width;
      height: @panel-height;
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
      padding: 8px 12px;
      font-weight: normal;
      font-size: 14px;
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