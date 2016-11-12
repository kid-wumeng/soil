<template lang="jade">

  .playground
    soil-input(v-model="birthdayString", facade="dark", :min="5", :max="10", @min-error="onMinError", @max-error="onMaxError")
      soil-date-picker(slot="dropdown", @input="onInput")
</template>



<script lang="coffee">

  module.exports =

    mounted: ->

    data: ->
      'birthday': {}
      'birthdayString': ''

    methods:
      'onInput': ({year, month, date}) ->
        @birthdayString = "#{year} 年 #{month} 月 #{date} 日"
      'onMinError': (value) ->
        console.log "太短：#{value}"
      'onMaxError': (value) ->
        console.log "太长：#{value}"

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

</style>