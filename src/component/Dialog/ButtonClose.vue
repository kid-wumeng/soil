<template lang="jade">

  .button-close(@click="$emit('close')")
    soil-icon(name="no")

</template>



<script lang="coffee">
  module.exports =
    components:
      'soil-icon': require '../Icon'
</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-dialog{
    >.soil-popup >.panel>.button-close{
      display: flex;
      justify-content: center;
      align-items: center;
      width: 32px;
      height: 32px;
      background-color: white;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
      border-radius: 100%;
      cursor: pointer;
      .soil-icon{
        font-size: 16px;
        color: @soil-gray-6;
      }
    }
  }

</style>