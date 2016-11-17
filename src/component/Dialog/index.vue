<template lang="jade">
  soil-popup.soil-dialog(
    :open="open",
    :style="styleObject",
    @click.native.self="onClickMask"
  )
    panel
      slot
</template>



<script lang="coffee">
  module.exports =
    components:
      'soil-popup': require '../Popup'
      'panel':      require './Panel'

    props:
      'open':
        type: Boolean
        default: false
      'alpha':
        type: Number
        default: 0.4

    computed:
      'styleObject': ->
        'backgroundColor': "rgba(0, 0, 0, #{@alpha})"

    methods:
      'onClickMask': ->
        @$emit('click-mask')
</script>



<style lang="less">
  .soil-dialog{
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  }
</style>