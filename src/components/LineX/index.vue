<template lang="jade">

  .soil-line-x(:style="styleObject")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

      'color':
        type: String
        default: 'soil-gray-1'


    computed:

      'styleObject': ->
        'borderBottomColor': util.color(@color)

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-line-x {
    border-bottom-width: 1px;
    border-bottom-style: solid;
  }

  [soil-dpr="2"] .soil-line-x,
  [soil-dpr="3"] .soil-line-x {
    border-bottom-width: 0.5px;
  }

</style>