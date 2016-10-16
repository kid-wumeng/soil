<template lang="jade">

  .playground
    soil-button( text="编辑资料" @click="say" color="blue" )
    soil-button( text="编辑资料" type="border" @click="say" color="green" )
    soil-button( text="编辑资料" type="nude" @click="say" color="red" )

</template>

<script lang="coffee">

  module.exports =
    methods:
      'say': ->
        console.log 'say a word'

</script>

<style lang="less">

  .d1 {
    width: 48px;
    height: 48px;
    background-color: red;
  }
  .d2 {
    width: 48px;
    height: 88px;
    background-color: blue;
  }
  .d3 {
    width: 48px;
    height: 48px;
    background-color: green;
  }
  .sep1 {
    display: inline-block;
    width: 3px;
    height: 100px;
    background-color: #000;
  }
  .sep2 {
    display: inline-block;
    width: 3px;
    height: 100px;
    background-color: #fff;
  }
  .soil-button {
    margin-left: 50px;
    margin-top: 50px;
  }

</style>