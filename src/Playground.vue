<template lang="jade">

  .playground
    soil-bar-x
      .d1
      .d2
      .d3
      .sep1(slot="sep")

</template>



<script lang="coffee">

  module.exports =

    mounted: ->

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

</style>