<template lang="jade">

  .soil-menu-cell-group
    .title {{ title }}
    soil-list-y(padding="0")
      slot
      soil-line-x(slot="sep")
    .description {{ description }}

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:
      'title':
        type: String
        default: null
      'description':
        type: String
        default: null

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-menu-cell-group{
    .title{
      margin-bottom: 12px;
      padding-left: 16px;
      padding-right: 16px;
      font-size: 14px;
      color: @soil-gray-8;
    }
    .soil-list-y{
      border-top: 1px solid @soil-gray-3;
      border-bottom: 1px solid @soil-gray-3;
    }
    .description{
      margin-top: 12px;
      padding-left: 16px;
      padding-right: 16px;
      font-size: 12px;
      color: @soil-gray-6;
    }
  }

  [soil-dpr="2"] .soil-menu-cell-group,
  [soil-dpr="3"] .soil-menu-cell-group{
    .soil-list-y{
      border-top-width: 0.5px;
      border-bottom-width: 0.5px;
    }
  }

</style>