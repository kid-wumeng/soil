<template lang="jade">

  soil-grid.year-panel-body(:cols="4", padding-row="8px")
    .year(
      v-for="year in years",
      @click="$emit('pick', year)"
    ) {{ year }}

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-grid': require '../Grid'

    props:
      'decade':
        type: Number
        required: true

    computed:
      'years': -> [@decade..@decade+9]

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-date-picker{
    .year-panel-body{
      .year{
        display: inline-flex;
        justify-content: center;
        align-items: center;
        box-sizing: border-box;
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