<template lang="jade">

  .playground
    //- soil-input(facade="dark" v-model="email")
    //-   soil-date-picker(slot="dropdown")
    soil-date-picker
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