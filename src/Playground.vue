<template lang="jade">

  .playground
    soil-drawer(ref="drawer")
      .d1
    soil-drawer(ref="drawer")
      .d2
    soil-button.show(label="打开抽屉", @click="show")
    soil-button.hide(label="关闭抽屉", @click="hide", color="red")
</template>

<script lang="coffee">

  module.exports =

    data: ->
      open: true

    mounted: ->
      this.$refs.drawer.show()

    methods:
      'show': ->
        this.$refs.drawer.show()
      'hide': ->
        this.$refs.drawer.hide()

</script>

<style lang="less" scoped>

  @import "./assets/styles/color";

  body {
    background-color: @soil-green;
  }

  .d1 {
    width: 300px;
    height: 100%;
    background-color: @soil-blue;
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
    width: 1px;
    height: 40px;
    background-color: #ccc;
  }
  .sep2 {
    display: inline-block;
    width: 20px;
    height: 40px;
    background-color: #ccc;
  }
  .soil-button {
    position: absolute;
    right: 100px;
    &.show {
      top: 50px;
    }
    &.hide {
      top: 150px;
    }
  }

</style>