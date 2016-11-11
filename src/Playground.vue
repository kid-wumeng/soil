<template lang="jade">

  .playground
    soil-input(facade="dark" v-model="email", :trim="false", :auto-dropdown="true")
      soil-date-picker(slot="dropdown")
    soil-button(label="显示值" color="soil-green" @click="onClick1")
    soil-button(label="设置值" color="soil-red" @click="onClick2")
</template>



<script lang="coffee">

  module.exports =

    mounted: ->

    data: ->
      'email': ''

    methods:
      'onClick1': ->
        console.log @email
      'onClick2': ->
        @email = 'kid.wumeng@gmail.com'

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