<template lang="jade">

  .soil-radio(:class="classObject", @click="onClick")
    circle-sign(v-if="facade === 'circle'")
    soil-label.label(:label="label")

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-label': require '../Label'
      'circle-sign': require './CircleSign'

    props:
      'label':
        type: String
        required: true
      'value':
        type: null
        required: true
      'facade':
        type: String
        default: 'circle'
      'defaultActive':
        type: Boolean
        default: false

    data: ->
      'active': @defaultActive

    computed:
      'classObject': ->
        '-circle': @facade is 'circle'
        '-square': @facade is 'square'  # @TODO Implement facade="square" (SquareSign)
        '-active': @active

    methods:
      'onClick': ->
        @active = !@active
        if @active
          @$emit('change', @value)
        else
          @$emit('change', null)


</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-radio.-circle{
    display: inline-flex;
    align-items: center;
    vertical-align: middle;
    cursor: pointer;
    .circle-sign{
      margin-right: 4px;
    }
    .label{
      font-size: 14px;
      color: @soil-black-light;
    }
  }

</style>