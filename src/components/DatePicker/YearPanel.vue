<template lang="jade">

  div.panel.year-panel
    year-panel-head(
      :decade="decade",
      @prev-decade="$emit('prev-decade')",
      @next-decade="$emit('next-decade')"
    )
    year-panel-body(
      :decade="decade",
      @pick="onPick"
    )

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'year-panel-head': require './YearPanelHead'
      'year-panel-body': require './YearPanelBody'

    props:
      'decade':
        type: Number
        required: true

    methods:
      'onPick': (year) -> @$emit('pick', year)

</script>


<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .year-panel-body{
      margin-top: 16px;
    }
  }

</style>