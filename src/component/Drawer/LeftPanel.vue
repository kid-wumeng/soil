<template lang="jade">

  .panel(:style="styleObject")
    slot

</template>



<script lang="coffee">

  module.exports =

    props:

      'hideOnDraw':
        type: Boolean
        required: true

      'hideOnSwipe':
        type: Boolean
        required: true


    data: ->
      'width': null
      'x': '-100%'
      'bySwipe': false


    computed:
      'styleObject': ->
        'transform': "translate3d(#{@x}, 0, 0)"


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
        hammer.on 'swipeleft', @onSwipe
        hammer.on 'panend',    @onSwipeEnd

      @width = panel.offsetWidth
      this.$emit('ready', @width)


    methods:

      'show': ->
        @x = '0'
        this.$emit('show-start')

      'hide': ->
        @x = '-100%'
        @bySwipe = false
        this.$emit('hide-start')

      'move': (distance) ->
        @x = "-#{distance}px"
        this.$emit('draw', distance)

      'nearEdge': (distance) ->
        return distance > @width / 2

      'onDrawStart': (event) ->
        this.$emit 'draw-start'

      'onDraw': (event) ->
        if event.offsetDirection is Hammer.DIRECTION_LEFT
          @move event.distance

      'onDrawEnd': (event) ->
        if not @bySwipe
          if event.offsetDirection is Hammer.DIRECTION_LEFT
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
        if @x is '0'
          this.$emit('show-end')

      'onHideEnd': () ->
        if @x is '-100%'
          this.$emit('hide-end')

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .panel {
    left: 0;
    top: 0;
    height: 100%;
  }

</style>