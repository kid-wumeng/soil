<template lang="jade">

  .soil-drawer-menu-item(@click="onClick")
    soil-label(:text="label")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

      'label':
        type: String
        required: true

      'value':
        type: null
        default: undefined

    methods:

      'onClick': ->
        this.$emit('select', @value)

</script>



<style lang="less" scoped>

  @import "../../assets/style/color";

  .soil-drawer-menu-item > .soil-label {
    height: 60px;
    font-size: 18px;
    color: @soil-black;
    background-color: white;
  }

</style>