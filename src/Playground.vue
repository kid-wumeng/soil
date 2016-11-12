<template lang="jade">

  .playground
    soil-dialog(ref="p1")
      div 对话框 1对话框 1对话框 1对话框 1对话框 1对话框 1对话框 1
      soil-button(slot="bar-left",  label="删除", color="soil-red")
      soil-button(slot="bar-right", label="确定")

</template>



<script lang="coffee">

  module.exports =

    mounted: ->
      @$refs.p1.show()

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
  }

</style>