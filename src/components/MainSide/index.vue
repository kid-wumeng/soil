<template lang="jade">

  .soil-main-side(:style="styleObject")

    left-side-area(:padding="padding")
      slot(name="left-side")

    main-area
      slot(name="main")

    right-side-area(:padding="padding")
      slot(name="right-side")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'left-side-area':  require './LeftSideArea'
      'main-area':       require './MainArea'
      'right-side-area': require './RightSideArea'

    props:
      'padding':
        type: String
        default: '0'

    computed:
      'styleObject': ->
        'padding': @padding

</script>



<style lang="less">

  .soil-main-side{
    display: flex;
    box-sizing: padding-box;
    .main-area{
      flex-grow: 1;
    }
  }

</style>