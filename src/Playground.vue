<template lang="jade">

  .playground
    soil-message-dialog(
      ref="dialog",
      title="作品申请已成功提交",
      message="我们将尽快处理",
      sure-label="OK",
      hide-on-click-mask,
      @sure="onSure",
      @hide="onHide",
    )

</template>



<script lang="coffee">

  module.exports =

    mounted: ->
      @$refs.dialog.show()
    updated: ->
      @$refs.dialog.show()

    methods:
      'onSure': ->
        console.log 'sure'
      'onHide': ->
        console.log 'hide'

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