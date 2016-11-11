<template lang="jade">

  soil-grid.date-panel-body(:cols="7")

    .day-label(
      v-for="dayLabel in dayLabels"
    ) {{ dayLabel }}

    .date-in-prev-week(
      v-for="date in datesInPrevWeek"
    ) {{ date }}

    .date(
      v-for="date in dates",
      @click="$emit('pick', date)"
    ) {{ date }}

    .date-in-next-week(
      v-for="date in datesInNextWeek"
    ) {{ date }}

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-grid': require '../Grid'

    props:
      'dayLabels':
        type: Array
        required: true
      'year':
        type: Number
        required: true
      'month':
        type: Number
        required: true

    computed:
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


</script>



<style lang="less">

  @import "../../assets/styles/color";

</style>