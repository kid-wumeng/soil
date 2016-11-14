<template lang="jade">

  .soil-popup(v-show="open", :style="styleObject", @click.stop="onClick")
    slot

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  count = 0

  module.exports =

    data: ->
      'open': false
      'zIndex': 0


    computed:
      'styleObject': ->
        'zIndex': @zIndex


    mounted: ->
      document.addEventListener 'click', @onClickOut


    destroyed: ->
      document.removeEventListener 'click', @onClickOut


    methods:
      'show': ->
        if @open is false
          count++
          @zIndex = count
          @open = true
          @$emit('show')

      'hide': ->
        if @open is true
          count--
          @open = false
          @$emit('hide')

      'onClick': ->

      'onClickOut': ->
        @$emit('click-out')

</script>



<style lang="less">

  .soil-popup{
    position: fixed;
    left: 0;
    top: 0;
  }

</style>