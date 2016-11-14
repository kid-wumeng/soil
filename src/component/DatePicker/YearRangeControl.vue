<template lang="jade">

  .year-range-control
    soil-icon.prev(name="arrow-left",  @click="$emit('prev-year')")
    soil-label.label(:label="label",   @click="$emit('switch-year-panel')")
    soil-icon.next(name="arrow-right", @click="$emit('next-year')")

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-icon':  require '../Icon'
      'soil-label': require '../Label'

    props:
      'year':
        type: Number
        required: true

    computed:
      'label': -> "#{@year}"

</script>



<style lang="less">

  @import "../../asset/style/color";

  .soil-date-picker{
    .year-range-control{
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