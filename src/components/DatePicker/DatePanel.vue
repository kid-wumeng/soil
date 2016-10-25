<template lang="jade">

  .date-panel(v-if="open")
    .head
      .year
        soil-icon(
          name="arrow-left",
          @click="year--"
        )
        soil-label(
          :text="yearLabel"
        )
        soil-icon(
          name="arrow-right",
          @click="year++"
        )
      .month
        soil-icon(
          name="arrow-left",
          @click="month--"
        )
        soil-label(
          :text="monthLabel"
        )
        soil-icon(
          name="arrow-right",
          @click="month++"
        )
    .body
      soil-grid(
        match-parent,
        :col-count="4"
      )
        .date(
          v-for="date in dates",
          @click="onSelectDate(date)"
        ) {{ date }}

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    data: ->
      'open': false
      'year': null
      'month': null

    computed:
      'yearLabel': -> "#{@year}"
      'monthLabel': -> "#{@month}"
      'dates': -> [1..new Date(@year, @month, 0).getDate()]

    methods:
      'show': (year, month) ->
        @year = year
        @month = month
        @open = true
      'hide': ->
        @open = false
      'onSelectDate': (date) ->
        this.$emit 'select-date', @year, @month, date

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .head {
    display: flex;
    justify-content: space-between;
    align-items: center;
    .year {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .month {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .soil-icon {
      cursor: pointer;
    }
  }

</style>