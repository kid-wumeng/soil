<template lang="jade">

  .soil-line-x

</template>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-line-x{
    width: 100%;
    color: @soil-gray-1;
    border-bottom-width: 1px;
    border-bottom-style: solid;
    border-bottom-color: currentColor;
  }

  [soil-dpr="2"] .soil-line-x,
  [soil-dpr="3"] .soil-line-x {
    border-bottom-width: 0.5px;
  }

</style>