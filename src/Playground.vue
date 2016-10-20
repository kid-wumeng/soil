<template lang="jade">

  .playground
    div {{msg}}
</template>

<script lang="coffee">

  module.exports =
    data: ->
      msg: 'none'
      formatErrorMessage: '验证失败，不是 6000'

    mounted: ->
      hammer = new Hammer document
      hammer.on 'pan', (event) =>
        now = new Date
        @msg = now.getTime()

    methods:
      'format': (value) ->
        return value is '6000'

      'onButton': ->
        alert('弹出日期选择器')

      'onFormatError': (value) ->

</script>

<style lang="less">

  @import "assets/common.less";

  body {
    background-color: white;
  }

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
    display: inline-block;
    width: 1px;
    height: 40px;
    background-color: #ccc;
  }
  .sep2 {
    display: inline-block;
    width: 20px;
    height: 40px;
    background-color: #ccc;
  }
  .soil-bar-x {
    margin-top: 50px;
    height: 80px;
    background-color: #000;
  }

</style>