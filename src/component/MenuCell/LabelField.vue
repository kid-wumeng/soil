<template lang="jade">

  div.label-field(v-if="open")
    soil-label.label(v-if="label", :label="label")
    soil-label.sub-label(v-if="subLabel", :label="subLabel")

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    props:
      'label':
        type: String
        default: null
      'subLabel':
        type: String
        default: null

    data: ->
      'open': @label or @subLabel

</script>



<style lang="less">

  @import "../../asset/style/color";

  .soil-menu-cell{
    .label-field{
      align-self: stretch;
      display: flex;
      flex-direction: column;
      justify-content: space-around;
      .label{
        font-size: 16px;
        color: @soil-black;
      }
      .sub-label{
        font-size: 12px;
        color: @soil-gray-6;
      }
      &.right{
        .label,
        .sub-label { text-align: right }
      }
    }
  }

</style>