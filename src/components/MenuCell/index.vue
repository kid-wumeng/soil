<template lang="jade">

  div.soil-menu-cell
    soil-flow-x(padding="12px")
      label-field.left(
        slot="left",
        :label="leftLabel",
        :sub-label="leftSubLabel"
      )
      label-field.right(
        slot="right",
        :label="rightLabel",
        :sub-label="rightSubLabel"
      )
      soil-icon.link(
        v-if="link",
        slot="right",
        name="arrow-right"
      )
      template(slot="right"): slot

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'label-field': require './LabelField'

    props:
      'link':
        type: Boolean
        default: false
      'leftLabel':
        type: String
        default: null
      'leftSubLabel':
        type: String
        default: null
      'rightLabel':
        type: String
        default: null
      'rightSubLabel':
        type: String
        default: null

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-menu-cell{
    box-sizing: border-box;
    height: 48px;
    padding: 6px 16px;
    background-color: white;
    .link{
      font-size: 16px;
      color: @soil-gray-6;
    }
  }

</style>