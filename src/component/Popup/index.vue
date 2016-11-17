<template lang="jade">
  .soil-popup(
    v-if="reset? open: true",
    v-show="open",
    :style="styleObject",
    @click.stop="void(0)"
  )
    slot
</template>



<script lang="coffee">

  $count = 0

  module.exports =
    props:
      'open':
        type: Boolean
        default: false
      'reset':
        type: Boolean
        default: false

    data: ->
      'zIndex': 0

    computed:
      'styleObject': ->
        'zIndex': @zIndex

    mounted: ->
      if @open
        $count++
        @zIndex = $count
      document.addEventListener 'click', @onClickOutside

    destroyed: ->
      document.removeEventListener 'click', @onClickOutside

    watch:
      'open': (open) ->
        if open
          $count++
          @zIndex = $count
        else
          $count--

    methods:
      'onClickOutside': -> @$emit('click-outside')
</script>



<style lang="less">
  .soil-popup{
    position: fixed;
    left: 0;
    top: 0;
  }
</style>