<template lang="jade">

  .soil-button(
    :class="classObject",
    :style="styleObject",
    @click="onClick"
  ) {{ label }}

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:
      'label':
        type: String
        required: true
      'facade':
        type: String
        default: 'ghost'
      'color':
        type: String
        default: 'soil-blue'
      'disabled':
        type: Boolean
        default: false


    computed:
      'classObject': ->
        '-solid': @facade is 'solid'
        '-ghost': @facade is 'ghost'
        '-nude':  @facade is 'nude'
        '-disabled': @disabled

      'styleObject': ->
        return {} if @disabled
        color = util.color(@color)
        switch @facade
          when 'solid' then return{ backgroundColor: color, borderColor: color }
          when 'ghost' then return{ color: color, borderColor: color }
          when 'nude'  then return{ color: color }


    methods:
      'onClick': -> @$emit('click') if not @disabled

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-button{
    display: inline-block;
    box-sizing: border-box;
    padding: 6px 12px;
    font-size: 12px;
    border-width: 1px;
    border-style: solid;
    border-radius: 2px;
    cursor: pointer;
    user-select: none;
    &.-solid{
      color: white
    }
    &.-nude{
      border-color: transparent
    }
    &.-disabled{
      color: @soil-gray-4;
      background-color: @soil-gray-1;
      border-color: @soil-gray-2;
      border-style: dashed;
    }
  }

  [soil-dpr="2"] .soil-button,
  [soil-dpr="3"] .soil-button{
    border-width: 0.5px;
  }

</style>