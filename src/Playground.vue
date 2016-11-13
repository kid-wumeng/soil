<template lang="jade">

  .playground
    //- soil-message-dialog(ref="message", message="作品申请提交成功，我们将尽快处理", @sure="onSure")

</template>



<script lang="coffee">

  module.exports =

    mounted: ->
      @$refs.popup.show()

    methods:
      'onLoad': (data) ->
        console.log data
      'onMaxError': (data) ->
        console.log data
      'onClick': ->
        console.log 111

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