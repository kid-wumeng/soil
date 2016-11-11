<template lang="jade">

  .month-range-control
    soil-icon.prev(name="arrow-left",  @click="$emit('prev-month')")
    soil-label(:label="label")
    soil-icon.next(name="arrow-right", @click="$emit('next-month')")

</template>



<script lang="coffee">

  module.exports =

    props:
      'month':
        type: Number
        required: true

    computed:
      'label': -> "#{@month}"

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .month-range-control{
    }
  }

</style>