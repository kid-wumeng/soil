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

  @import "../../asset/style/color.less";

  .soil-table-cell{
    display: table-cell;
    height: 36px;
    padding-left: 8px;
    padding-right: 8px;
    vertical-align: middle;
    border-bottom: 1px solid #F9F9F9;
    &:first-child{ padding-left: 16px }
    &:last-child{ padding-right: 16px }
    .label{
      font-size: 12px;
      color: @soil-black-light;
    }
  }

  .soil-table-row.-title > .soil-table-cell{
    border-bottom: none;
  }

</style>