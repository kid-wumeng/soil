<template lang="pug">
  .playground
    soil-flow-x
      .d1(slot="left")
      .d2
      .d2
      .d2
      .d3(slot="right")
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
    width: 3px;
    height: 50px;
    background-color: #000;
  }
  .sep2 {
    width: 3px;
    height: 50px;
    background-color: #fff;
  }
  .soil-flow-x {
    background-color: yellow;
  }
</style>
