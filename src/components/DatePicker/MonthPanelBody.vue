<template lang="jade">

  soil-grid.month-panel-body(:cols="4")
    .month(
      v-for="month in 12",
      @click="$emit('pick', month)"
    ) {{ month }}

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-grid': require '../Grid'

</script>



<style lang="less">

  @import "../../assets/styles/color";

</style>