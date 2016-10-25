<template lang="jade">

  .year-panel(v-if="open")
    .head
      soil-icon(
        name="arrow-left",
        @click="yearStart -= 10"
      )
      soil-label(
        :text="label"
      )
      soil-icon(
        name="arrow-right",
        @click="yearStart += 10"
      )
    .body
      soil-grid(
        match-parent,
        :col-count="4"
      )
        .year(
          v-for="year in years",
          @click="onSelectYear(year)"
        ) {{ year }}

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    data: ->
      'open': false
      'yearStart': null

    computed:
      'label': -> "#{@yearStart} - #{@yearStart+9}"
      'years': -> [@yearStart..@yearStart+9]

    methods:
      'show': (decade) ->
        @yearStart = parseInt(decade / 10) * 10
        @open = true
      'hide': ->
        @open = false
      'onSelectYear': (year) ->
        this.$emit 'select-year', year

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