<template lang="jade">

  .year-panel-head
    decade-range-control(
      :decade="decade",
      @prev-decade="$emit('prev-decade')",
      @next-decade="$emit('next-decade')",
    )

</template>



<script lang="coffee">

  module.exports =

    components:
      'decade-range-control': require './DecadeRangeControl'

    props:
      'decade':
        type: Number
        required: true

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .year-panel-head{
      display: flex;
      justify-content: center;
    }
  }

</style>