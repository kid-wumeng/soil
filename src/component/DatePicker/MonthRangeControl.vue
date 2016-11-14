<template lang="jade">

  .month-range-control
    soil-icon.prev(name="arrow-left",  @click="$emit('prev-month')")
    soil-label.label(:label="label",   @click="$emit('switch-month-panel')")
    soil-icon.next(name="arrow-right", @click="$emit('next-month')")

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    components:
      'soil-icon':  require '../Icon'
      'soil-label': require '../Label'

    props:
      'month':
        type: Number
        required: true
      'monthLabels':
        type: Array
        required: true

    computed:
      'label': -> "#{@monthLabels[@month-1]}"

</script>



<style lang="less">

  @import "../../asset/style/color";

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
        padding: 8px 12px;
        font-size: 12px;
        color: @soil-black-light;
        cursor: pointer;
        user-select: none;
        transition: background-color 0.3s ease;
        &:hover{
          background-color: @soil-gray-1;
        }
      }
    }
  }

</style>