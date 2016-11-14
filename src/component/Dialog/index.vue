<template lang="jade">

  soil-popup.soil-dialog(
    ref="popup",
    :style="styleObject",
    @show="$emit('show')",
    @hide="$emit('hide')",
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
      'alpha':
        type: Number
        default: 0.4
      'hideOnClickMask':
        type: Boolean
        default: false


    computed:
      'styleObject': ->
        'backgroundColor': "rgba(0, 0, 0, #{@alpha})"


    methods:
      'show': ->
        @$refs.popup.show()

      'hide': ->
        @$refs.popup.hide()

      'onClickMask': ->
        @hide() if @hideOnClickMask

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