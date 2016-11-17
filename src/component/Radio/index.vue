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
      'value':
        type: Boolean
        default: false
      'data':
        type: null
        default: null
      'label':
        type: String
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
        @$emit('input', @active)
        if @active
          @$emit('change', @data)
        else
          @$emit('change', null)


</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-radio{
    display: inline-flex;
    align-items: center;
    height: 18px;
    cursor: pointer;
    .circle-sign{
      margin-right: 4px;
    }
    .label{
      font-size: 12px;
      color: @soil-gray-6;
      -webkit-font-smoothing: antialiased;
      transition: color 0.8s ease;
    }
  }

  .soil-radio.-active{
    .label{
      color: @soil-black-light;
    }
  }

</style>