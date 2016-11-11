<template lang="jade">

  .year-range-control
    soil-icon.prev(name="arrow-left",  @click="$emit('prev-year')")
    soil-label(:label="label")
    soil-icon.next(name="arrow-right", @click="$emit('next-year')")

</template>



<script lang="coffee">

  module.exports =

    props:
      'year':
        type: Number
        required: true

    computed:
      'label': -> "#{@year}"

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .year-range-control{
    }
  }

</style>