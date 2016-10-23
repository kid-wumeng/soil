<template lang="jade">

  .soil-switch( :class="classObject" @click="onClick" )
    .active-layer
    .button

</template>



<script lang="coffee">

  module.exports =

    props:

      'value':
        type: null

      'color':
        type: String
        default: 'blue'


    data: ->
      'active': false


    computed:
      'classObject': ->
        '-red':    @color is 'red'
        '-green':  @color is 'green'
        '-blue':   @color is 'blue'
        '-yellow': @color is 'yellow'
        '-on':   @active
        '-off': !@active


    methods:
      'onClick': ->
        @active = !@active
        this.$emit 'input', @active

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-switch {
    display: inline-block;
    width: 52px;
    height: 30px;
    border-width: 1px;
    border-style: solid;
    border-radius: 16px;
    cursor: pointer;
    user-select: none;
    overflow: hidden;
    position: relative;
    transition: background-color 0.3s ease, border-color 0.3s ease;
  }

  .soil-switch > .active-layer {
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    margin: auto;
    width: 100%;
    height: 100%;
    background-color: white;
    border-radius: 16px;
    transition: transform 0.3s ease;
  }

  .soil-switch > .button {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-top: auto;
    margin-bottom: auto;
    width: 28px;
    height: 28px;
    border-radius: 100%;
    background-color: white;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.4);
    transition: transform 0.3s ease;
  }

  .soil-switch.-on
  {
    &.-red {
      background-color: @soil-red;
      border-color: @soil-red;
    }
    &.-green {
      background-color: @soil-green;
      border-color: @soil-green;
    }
    &.-blue {
      background-color: @soil-blue;
      border-color: @soil-blue;
    }
    &.-yellow {
      background-color: @soil-yellow;
      border-color: @soil-yellow;
    }
    > .active-layer { transform: scale3d(0, 0, 1) }
    > .button { transform: translate3d(23px, 0, 0) }
  }

  .soil-switch.-off
  {
    background-color: white;
    border-color: #DFDFDF;
    > .active-layer { transform: scale3d(1, 1, 1) }
    > .button { transform: translate3d(1px, 0, 0) }
  }

</style>