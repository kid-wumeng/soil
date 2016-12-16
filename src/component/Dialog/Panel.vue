<template lang="jade">

  .panel
    button-close(v-if="buttonClose", @close="$emit('close')")
    slot

</template>



<script lang="coffee">

  module.exports =
    components:
      'button-close': require './ButtonClose'

    props:
      'padding':
        type: Number
        default: 0
      'buttonClose':
        type: Boolean
        required: true

    computed:
      'styleObject': ->
        'padding': @padding

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-dialog{
    >.soil-popup >.panel{
      background-color: white;
      border-radius: 2px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
      position: relative;
      >.button-close{
        position: absolute;
        right: -16px;
        top: -16px;
      }
    }
  }

</style>