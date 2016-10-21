<template lang="jade">

  .panel(:style="styleObject")
    slot

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    data: ->

      'width': 0

      'x': '-100%'


    computed:

      'styleObject': ->
        'transform': "translate3d(#{@x}, 0, 0)"


    mounted: ->

      panel = this.$el
      panel.addEventListener 'transitionend', =>
        switch @x
          when '0'     then this.$emit('show-end')
          when '-100%' then this.$emit('hide-end')

      @width = panel.offsetWidth
      this.$emit('ready', @width)

      hammer = new Hammer panel

      hammer.on 'panstart', (event) =>
        this.$emit('draw-start')

      hammer.on 'panmove', (event) =>
        if event.offsetDirection is Hammer.DIRECTION_LEFT
          @move event.distance

      hammer.on 'panend', (event) =>
        this.$emit('draw-end')
        if @nearEdge event.distance
          @hide()
        else
          @show()


    methods:

      'show': ->
        @x = '0'
        this.$emit('show-start')

      'hide': ->
        @x = '-100%'
        this.$emit('hide-start')

      'move': (distance) ->
        @x = "-#{distance}px"
        this.$emit('move', distance)

      'nearEdge': (distance) ->
        return distance > @width / 2

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

</style>