<template lang="jade">

  .decade-range-control
    soil-icon.prev(name="arrow-left",  @click="$emit('prev-decade')")
    soil-label(:label="label")
    soil-icon.next(name="arrow-right", @click="$emit('next-decade')")

</template>



<script lang="coffee">

  module.exports =

    props:
      'decade':
        type: Number
        required: true

    computed:
      'label': -> "#{@decade} - #{@decade+9}"

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .decade-range-control{
      color: @soil-gray-3;
    }
  }

</style>