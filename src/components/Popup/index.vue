<template lang="jade">

  .soil-popup(v-if="open", :style="styleObject", @click.self="onClick")
    slot

</template>



<script lang="coffee">

  count = 0

  module.exports =

    props:
      'alpha':
        type: Number
        default: 0.4
        validator: (alpha) -> alpha >= 0 and alpha <= 1

    data: ->
      'open': false
      'zIndex': 0

    computed:
      'styleObject': ->
        'zIndex': @zIndex
        'backgroundColor': "rgba(0, 0, 0, #{@alpha})"

    methods:
      'show': ->
        if @open is false
          count++
          @zIndex = count
          @open = true

      'hide': ->
        if @open is true
          count--
          @open = false
          @$emit('hide')

      'onClick': ->
        @$emit('click-mask')
        @hide()

</script>



<style lang="less">

  .soil-popup{
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  }

</style>