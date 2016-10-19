<template lang="jade">

  .playground
    soil-input( icon="search", label="昵称", hint="中文、英文", v-model="msg", type="underscore", disabled, :format="format", @validate-format-fail="onValidateFail" )
    //- pre "{{msg}}"

</template>

<script lang="coffee">

  module.exports =
    data: ->
      msg: '吴蒙 KID'
    methods:
      'format': (value) ->
        return value is '6000'

      'onValidateFail': (value) ->
        console.log "验证失败：#{value}"

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
  .soil-input {
    margin-left: 50px;
    margin-top: 50px;
  }

</style>