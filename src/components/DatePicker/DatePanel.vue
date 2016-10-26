<template lang="jade">

  div.panel.date-panel(v-if="open")

    div.head

      div.range-control
        soil-icon(
          name="arrow-left",
          @click="year--"
        )
        div.label.-enabled(
          @click="onSwitchYearPanel"
        )  {{ yearLabel }}
        soil-icon(
          name="arrow-right",
          @click="year++"
        )

      div.range-control
        soil-icon(
          name="arrow-left",
          @click="onSelectPrevMonth"
        )
        div.label.-enabled(
          @click="onSwitchMonthPanel"
        ) {{ monthLabel }}
        soil-icon(
          name="arrow-right",
          @click="onSelectNextMonth"
        )

    soil-grid.body(match-parent, :col-count="7")

      div.point.day-label(
        v-for="dayLabel in dayLabels"
      ) {{ dayLabel }}

      div.point.-disabled(
        v-for="date in datesInPrevWeek"
      ) {{ date }}

      div.point.-enabled(
        v-for="date in dates",
        @click="onSelectDate(date)"
      ) {{ date }}

      div.point.-disabled(
        v-for="date in datesInNextWeek"
      ) {{ date }}

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:
      'monthLabels':
        type: Array
        required: true
      'dayLabels':
        type: Array
        required: true

    data: ->
      'open':  false
      'year':  null
      'month': null

    computed:
      'yearLabel':  -> @year
      'monthLabel': -> @monthLabels[@month-1]
      'datesInPrevWeek': ->
        lastDateInPrevMonth = new Date @year, @month-1, 0
        date = lastDateInPrevMonth.getDate()
        day  = lastDateInPrevMonth.getDay()
        return [date-day..date]
      'dates': ->
        lastDateInThisMonth = new Date @year, @month, 0
        date = lastDateInThisMonth.getDate()
        return [1..date]
      'datesInNextWeek': ->
        lastDateInThisMonth = new Date @year, @month, 0
        day = lastDateInThisMonth.getDay()
        return if day < 6 then [1..6-day] else []

    methods:
      'show': (@year, @month) -> @open = true
      'hide':                 -> @open = false
      'onSwitchYearPanel':    -> this.$emit 'switch-year-panel', @year
      'onSwitchMonthPanel':   -> this.$emit 'switch-month-panel', @year
      'onSelectPrevMonth':    -> if @month > 1  then @month-- else @year-- and @month = 12
      'onSelectNextMonth':    -> if @month < 12 then @month++ else @year++ and @month = 1
      'onSelectDate': (date)  -> this.$emit 'select-date', @year, @month, date

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .date-panel{
      .head{
        display: flex;
        justify-content: space-between;
        .range-control{ flex-basis: 100px }
      }
      .body{
        .day-label{ color: @soil-gray-6 }
      }
    }
  }

</style>