<template lang="jade">

  soil-grid.month-panel-body(:cols="4")
    .month(
      v-for="month in 12",
      @click="$emit('pick', month)"
    ) {{ monthLabels[month-1] }}

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-grid': require '../Grid'

    props:
      'monthLabels':
        type: Array
        required: true

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .month-panel-body{
      .month{
        display: inline-flex;
        justify-content: center;
        align-items: center;
        width: 70px;
        height: 40px;
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