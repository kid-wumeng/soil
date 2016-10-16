<template lang="jade">

  soil-list-x.soil-bar-x( padding="0" )
    slot

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-list-x': require '../ListX'

</script>



<style lang="less">

  @import "../../assets/common";

  .soil-bar-x > .item {
    flex-grow: 1;
    display: flex;
    justify-content: center;
  }

</style>