<template lang="jade">

  .decade-range-control
    soil-icon.prev(name="arrow-left",  @click="$emit('prev-decade')")
    soil-label.label(:label="label")
    soil-icon.next(name="arrow-right", @click="$emit('next-decade')")

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    components:
      'soil-icon':  require '../Icon'
      'soil-label': require '../Label'

    props:
      'decade':
        type: Number
        required: true

    computed:
      'label': -> "#{@decade} - #{@decade+9}"

</script>



<style lang="less">

  @import "../../asset/style/color";

  .soil-date-picker{
    .decade-range-control{
      width: 160px;
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
        cursor: default;
        user-select: none;
      }
    }
  }

</style>