<template lang="jade">

  .playground
    soil-input(facade="light" @change="onChange")
      soil-icon(slot="left" name="search")
      soil-icon(slot="right" name="no")

</template>



<script lang="coffee">

  module.exports =

    mounted: ->

    methods:
      'onChange': (value) ->
        console.log value

</script>



<style lang="less">

  @import "./assets/styles/color";

  .d1 {
    width: 248px;
    height: 88px;
    background-color: red;
  }
  .d2 {
    width: 48px;
    height: 48px;
    background-color: blue;
  }
  .d3 {
    width: 48px;
    height: 48px;
    background-color: green;
  }
  .sep1 {
    width: 10px;
    height: 40px;
    background-color: #333;
  }
  .sep2 {
    width: 10px;
    height: 40px;
    background-color: #333;
  }

  body{
    background-color: @soil-blue;
  }
  .playground{
    padding: 100px;
  }

  .soil-icon{
    font-size: 14px;
    color: @soil-gray-8;
  }

</style>