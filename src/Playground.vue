<template lang="jade">

  .playground
    soil-file-picker(@load="onLoad", data-url, :mimes="['image/png']", @mime-error="onMaxError")
      soil-button(label="上传图片")
      soil-button(label="上传图片")
      .d1

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