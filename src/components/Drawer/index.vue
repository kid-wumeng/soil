<template lang="jade">

  .soil-drawer(:class="classObject", :style="styleObject")

    shadow-layer(
      :alpha="dynamicAlpha",
      @click.native.self="onClickShadow"
    )

    left-panel(
      ref="panel",
      @ready="onPanelReady",
      @draw-start="onDrawPanelStart",
      @show-start="onPanelShowStart",
      @hide-start="onPanelHideStart",
      @draw-end="onDrawPanelEnd",
      @hide-end="onPanelHideEnd",
      @move="onPanelMove"
    )
      slot

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =


    components:

      'shadow-layer': require './ShadowLayer'
      'left-panel': require './LeftPanel'

    props:

      'hideOnClickShadow':
        type: Boolean
        default: true

      'alpha':
        type: Number
        default: 0.8

    data: ->
      'open': false
      'width': null
      'dynamicAlpha': @alpha
      'drawing': @drawing

    computed:

      'classObject': ->
        '-drawing': @drawing

      'styleObject': ->
        'visibility': if @open then 'visible' else 'hidden'

    methods:

      'show': ->
        @open = true
        this.$refs.panel.show()

      'hide': ->
        this.$refs.panel.hide()

      'onPanelReady': (width) ->
        @width = width

      'onDrawPanelStart': ->
        @drawing = true

      'onDrawPanelEnd': ->
        @drawing = false

      'onPanelShowStart': ->
        @dynamicAlpha = @alpha

      'onPanelHideStart': ->
        @dynamicAlpha = 0

      'onPanelHideEnd': ->
        @open = false

      'onPanelMove': (distance) ->
        ratio = 1 - distance / @width
        @dynamicAlpha = @alpha * ratio

      'onClickShadow': ->
        if @hideOnClickShadow then @hide()

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-drawer {
    background-color: @soil-blue;
    position: fixed;
    z-index: 1;
    width: 100%;
    height: 100%;
    -webkit-tap-highlight-color: transparent;
  }

  .soil-drawer > .panel {
    position: absolute;
    left: 0;
    top: 0;
    display: inline-block;
    height: 100%;
    background-color: white;
    transition: transform 0.3s ease;
  }

  .soil-drawer.-drawing > .panel {
    transition: none;
  }


</style>