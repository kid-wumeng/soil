<template lang="jade">

  .playground
    soil-icon(name="search", label="搜索", color="red")

</template>

<script lang="coffee">

  module.exports =
    data: ->
      msg: ''
      formatErrorMessage: '验证失败，不是 6000'

    mounted: ->

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
    width: 348px;
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
    width: 4px;
    height: 40px;
    background-color: #000;
  }
  .sep2 {
    display: inline-block;
    width: 3px;
    height: 100px;
    background-color: #fff;
  }
  .soil-list-y {
    margin-left: 50px;
    margin-top: 50px;
  }

</style>