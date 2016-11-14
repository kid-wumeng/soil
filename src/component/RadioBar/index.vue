<template lang="jade">

  .soil-radio-bar
    slot

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    mounted: ->
      for radio, i in @$children
        radio.index = i
        radio.$on 'click', @onClick

    methods:
      'onClick': (event) ->
        radio = event.target
        index = radio.index
        leftRadio = @$children[radio.index-1]
        rightRadio = @$children[radio.index+1]
        if radio.active
          if rightRadio
            rightRadio.leftBright = true
        else
          if rightRadio and not rightRadio.active
            rightRadio.leftBright = false

</script>



<style lang="less">

  @import "../../asset/style/color";
  
  .soil-radio-group{
    display: inline-flex;
    >.soil-radio{
      margin-left: -1px;
      &.-active{
      }
    }
  }

</style>