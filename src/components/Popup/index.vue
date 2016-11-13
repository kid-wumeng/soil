<template lang="jade">

  .soil-popup(v-if="open", :class="classObject", :style="styleObject")
    content-area
      slot

</template>



<script lang="coffee">

  count = 0

  module.exports =

    components:
      'content-area': require './ContentArea'

    props:
      # @TODO To lock scroll.
      'modal':
        type: Boolean
        default: false


    data: ->
      'open': false
      'zIndex': 0


    computed:
      'classObject': ->
        '-modal': @modal

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

      'onClickOut': ->
        @$emit('click-out')

</script>



<style lang="less">

  .soil-popup{
    position: fixed;
    left: 0;
    top: 0;
    &.-modal{
      width: 100%;
      height: 100%;
    }
  }

</style>