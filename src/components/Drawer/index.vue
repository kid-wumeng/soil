<template lang="jade">

  .soil-drawer(:class="classObject", :style="styleObject")

    shadow-layer(
      :alpha="dynamicAlpha",
      @click.native.self="onClickShadow"
    )

    bottom-panel(
      ref="panel",
      :hide-on-draw="hideOnDraw",
      :hide-on-swipe="hideOnSwipe",
      @ready="onReadyPanel",
      @draw-start="onDrawStart",
      @draw="onDraw"
      @draw-end="onDrawEnd",
      @swipe-end="onSwipeEnd",
      @show-start="onShowStart",
      @hide-start="onHideStart",
      @hide-end="onHideEnd",
    )
      slot

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'shadow-layer': require './ShadowLayer'
      'left-panel': require './LeftPanel'
      'right-panel': require './RightPanel'
      'top-panel': require './TopPanel'
      'bottom-panel': require './BottomPanel'


    props:

      'hideOnDraw':
        type: Boolean
        default: true

      'hideOnSwipe':
        type: Boolean
        default: true

      'hideOnClickShadow':
        type: Boolean
        default: true

      'alpha':
        type: Number
        default: 0.4


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

      'onReadyPanel': (width) ->
        @width = width

      'onDrawStart': ->
        @drawing = true

      'onDrawEnd': ->
        @drawing = false

      'onSwipeEnd': ->
        @drawing = false

      'onShowStart': ->
        @dynamicAlpha = @alpha

      'onHideStart': ->
        @dynamicAlpha = 0

      'onHideEnd': ->
        @open = false

      'onDraw': (distance) ->
        ratio = 1 - distance / @width
        @dynamicAlpha = @alpha * ratio

      'onClickShadow': ->
        if @hideOnClickShadow then @hide()

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-drawer {
    position: fixed;
    z-index: 1;
    width: 100%;
    height: 100%;
    -webkit-tap-highlight-color: transparent;
  }

  .soil-drawer > .panel {
    position: absolute;
    display: inline-block;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease;
  }

  .soil-drawer.-drawing > .panel { transition: none }

</style>