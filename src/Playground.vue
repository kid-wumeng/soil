<template lang="pug">
  .playground
    soil-flow-x(padding="4px")
      .d1(slot='left') 1
      .d1(slot='left') 1
      .d1(slot='left') 1
      .d2 2
      .d2 2
      .d3(slot='right') 3
      .d3(slot='right') 3
      .d3(slot='right') 3
      .d3(slot='right') 3
      .d3(slot='right') 3
      .d3(slot='right') 3
      .d3(slot='right') 3
      .sep1(slot="sep")
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
  .soil-bar-x > .item {
     background-color: #ccc;
  }
</style>
