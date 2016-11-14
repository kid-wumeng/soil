<template lang="jade">

  .soil-drawer-menu
    soil-drawer(
      ref="drawer",
      from="bottom",
      :shadow="false",
      :hide-on-draw="false",
      :hide-on-swipe="false",
    )
      soil-list-y(padding="0")
        slot
        soil-line-x(slot="sep", color="soil-gray-3")
      soil-label.cancel(:text="cancelLabel", @click="onClickCancel")

</template>



<script lang="coffee">

  util = require '../../asset/util'

  module.exports =

    props:

      'cancelLabel':
        type: String
        default: 'Cancel'


    methods:

      'show': ->
        this.$refs.drawer.show()

      'hide': ->
        this.$refs.drawer.hide()

      'onClickCancel': ->
        @hide()

</script>



<style lang="less" scoped>

  @import "../../asset/style/color";

  .soil-drawer-menu {
    .soil-drawer {
      // @TODO Change to mixin of less
      // @TODO Change to soil-panel
      .soil-list-y {
        margin: 0 8px;
        margin-bottom: 8px;
        border-radius: 8px;
        overflow: hidden;
      }
      .soil-label {
        margin: 0 8px;
        margin-bottom: 8px;
        height: 60px;
        font-size: 18px;
        font-weight: bold;
        color: @soil-gray-6;
        background-color: white;
        border-radius: 8px;
      }
    }
  }

</style>