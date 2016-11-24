<template lang="jade">

  .soil-main-side

    left-side-area(:padding="padding")
      slot(name="left-side")

    main-area
      slot(name="main")

    right-side-area(:padding="padding")
      slot(name="right-side")

</template>



<script lang="coffee">

  module.exports =

    components:
      'left-side-area':  require './LeftSideArea'
      'main-area':       require './MainArea'
      'right-side-area': require './RightSideArea'

    props:
      'padding':
        type: String
        default: '0'

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-main-side{
    display: flex;
    box-sizing: padding-box;
  }

</style>