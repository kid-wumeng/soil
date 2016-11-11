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

  .soil-date-picker{
    .date-panel-body{
      .day-label,
      .date-in-prev-week,
      .date,
      .date-in-next-week{
        display: inline-flex;
        justify-content: center;
        align-items: center;
        width: 40px;
        height: 32px;
        font-size: 12px;
        color: @soil-black-light;
        user-select: none;
      }
      .day-label{
        color: @soil-gray-6;
        cursor: default;
      }
      .date-in-prev-week{
        color: @soil-gray-3;
        cursor: not-allowed;
      }
      .date{
        cursor: pointer;
        transition: background-color 0.3s ease;
        &:hover{
          background-color: @soil-gray-1;
        }
      }
      .date-in-next-week{
        color: @soil-gray-3;
        cursor: not-allowed;
      }
    }
  }

</style>