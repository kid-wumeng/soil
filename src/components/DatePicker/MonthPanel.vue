<template lang="jade">

  .month-panel(v-if="open")
    .head
      soil-icon(
        name="arrow-left",
        @click="year--"
      )
      soil-label(
        :text="label"
      )
      soil-icon(
        name="arrow-right",
        @click="year++"
      )
    .body
      soil-grid(
        match-parent,
        :col-count="4"
      )
        .month(
          v-for="month in 12",
          @click="onSelectMonth(month)"
        ) {{ month }}

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    data: ->
      'open': false
      'year': null

    computed:
      'label': -> "#{@year}"

    methods:
      'show': (year) ->
        @year = year
        @open = true
      'hide': ->
        @open = false
      'onSelectMonth': (month) ->
        this.$emit 'select-month', @year, month

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .head {
    display: flex;
    justify-content: space-between;
    align-items: center;
    .soil-icon {
      cursor: pointer;
    }
  }

</style>