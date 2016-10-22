
<template lang="jade">

  .panel(:style="styleObject")
    slot

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

      'hideOnDraw':
        type: Boolean
        required: true

      'hideOnSwipe':
        type: Boolean
        required: true


    data: ->
      'height': null
      'y': '100%'
      'bySwipe': false


    computed:
      'styleObject': ->
        'transform': "translate3d(0, #{@y}, 0)"


    mounted: ->

      panel = this.$el
      panel.addEventListener 'transitionend', @onShowEnd
      panel.addEventListener 'transitionend', @onHideEnd

      hammer = new Hammer panel

      if @hideOnDraw
        hammer.on 'panstart',  @onDrawStart
        hammer.on 'panmove',   @onDraw
        hammer.on 'panend',    @onDrawEnd

      if @hideOnSwipe
        hammer.on 'swipedown', @onSwipe
        hammer.on 'panend',    @onSwipeEnd

      @height = panel.offsetHeight
      this.$emit('ready', @height)


    methods:

      'show': ->
        @y = '0'
        this.$emit('show-start')

      'hide': ->
        @y = '100%'
        @bySwipe = false
        this.$emit('hide-start')

      'move': (distance) ->
        @y = "#{distance}px"
        this.$emit('draw', distance)

      'nearEdge': (distance) ->
        return distance > @height / 2

      'onDrawStart': (event) ->
        this.$emit 'draw-start'

      'onDraw': (event) ->
        if event.offsetDirection is Hammer.DIRECTION_DOWN
          @move event.distance

      'onDrawEnd': (event) ->
        if not @bySwipe
          if event.offsetDirection is Hammer.DIRECTION_DOWN
            if @nearEdge event.distance
              @hide()
            else
              @show()
          this.$emit('draw-end')

      'onSwipe': (event)->
        @bySwipe = true

      'onSwipeEnd': ->
        if @bySwipe
          @hide()
          this.$emit('swipe-end')

      'onShowEnd': () ->
        if @y is '0'
          this.$emit('show-end')

      'onHideEnd': () ->
        if @y is '100%'
          this.$emit('hide-end')

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .panel {
    left: 0;
    bottom: 0;
    width: 100%;
  }

</style>