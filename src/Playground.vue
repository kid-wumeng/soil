<template lang="pug">
  .playground
    soil-list-x
      .d1
      .d2
      .d3
      .sep1(slot="sep")
</template>

<script lang="coffee">
</script>

<style lang="less">
  .d1 {
    width: 200px;
    height: 200px;
    background-color: red;
  }
  .d2 {
    width: 300px;
    height: 100px;
    background-color: blue;
  }
  .d3 {
    width: 100px;
    height: 150px;
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
  .list-x {
    background-color: yellow;
  }
</style>
