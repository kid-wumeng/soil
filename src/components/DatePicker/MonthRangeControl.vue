<template lang="jade">

  .month-range-control
    soil-icon.prev(name="arrow-left",  @click="$emit('prev-month')")
    soil-label.label(:label="label")
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
      width: 120px;
      display: inline-flex;
      justify-content: space-between;
      align-items: center;
      >.prev,
      >.next{
        padding: 8px 12px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        &:hover{
          background-color: @soil-gray-1;
        }
      }
      >.label{
        font-size: 12px;
        color: @soil-gray-3;
      }
    }
  }

</style>