<template lang="jade">

  .soil-table-cell
    .label(v-if="!$slots.default") {{ label }}
    slot

</template>



<script lang="coffee">

  module.exports =

    props:
      'label':
        type: null
        default: ''

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-table-cell{
    display: table-cell;
    height: 36px;
    padding-left: 8px;
    padding-right: 8px;
    vertical-align: middle;
    border-top-width: 1px;
    border-bottom-width: 1px;
    border-top-style: solid;
    border-bottom-style: solid;
    border-top-color: transparent;
    border-bottom-color: @soil-gray-1;
    &:first-child{ padding-left: 16px }
    &:last-child{ padding-right: 16px }
    .label{
      font-size: 12px;
      color: @soil-black-light;
    }
  }

  .-title > .soil-table-cell{
    border-top-color: @soil-gray-1;
  }

</style>