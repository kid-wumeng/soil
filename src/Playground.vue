<template lang="jade">

  .playground
    soil-popup(ref="p1", :alpha="0.8")
      h1 xxx
    soil-popup(ref="p2")
      h1 yyy
    soil-button(label="打开 1", @click="$refs.p1.show()")
    soil-button(label="关闭 1", @click="$refs.p1.hide()")
    soil-button(label="打开 2", @click="$refs.p2.show()")
    soil-button(label="关闭 2", @click="$refs.p2.hide()")

</template>



<script lang="coffee">

  module.exports =

    mounted: ->

    methods:
      'onLoad': (data) ->
        console.log data
      'onMaxError': (data) ->
        console.log data

</script>



<style lang="less">

  @import "./assets/styles/color";

  .d1 {
    width: 48px;
    height: 48px;
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
  }
  .playground{
    padding: 100px;
  }

  .soil-icon{
    color: @soil-gray-8;
  }
  .search{
    font-size: 24px;
  }
  .no{
    font-size: 12px;
  }

  .soil-date-picker{
  }
  .soil-button{
    margin-right: 20px;
  }

</style>