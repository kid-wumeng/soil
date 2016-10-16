<template lang="pug">
  .playground
    soil-label( :text="text", ellipsis )
</template>

<script lang="coffee">
  module.exports =
    data: ->
      text: '很高的知名度。'
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
  .soil-label {
  }
</style>
