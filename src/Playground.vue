<template lang="pug">
  .playground
    soil-bar-x
      .d1
      .d2
      .d3
      .d1
      .d2
      .sep1(slot="sep")
      .sep2(slot="sep")
</template>

<script lang="coffee">
</script>

<style lang="less">
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
  .soil-bar-x > .item {
     background-color: #ccc;
  }
</style>
