<template lang="jade">

  .soil-line-x

</template>



<script lang="coffee">

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-line-x {
    border-bottom-width: 1px;
    border-bottom-style: solid;
    border-bottom-color: @soil-gray-light;
  }

  [soil-dpr="2"] .soil-line-x,
  [soil-dpr="3"] .soil-line-x {
    border-bottom-width: 0.5px;
  }

</style>