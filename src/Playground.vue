<template lang="pug">
  .playground
    soil-list-x
      .sep1(slot="sep")
      .sep2(slot="sep")
      .d1
      .d2
      .d3
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
    display: inline;
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
  .soil-list-x {
    background-color: yellow;
  }
</style>
