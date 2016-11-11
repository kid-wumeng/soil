<template lang="jade">

  soil-grid.year-panel-body(:cols="4")
    .year(
      v-for="year in years",
      @click="$emit('pick', year)"
    ) {{ year }}

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-grid': require '../Grid'

    props:
      'decade':
        type: Number
        required: true

    computed:
      'years': -> [@decade..@decade+9]

</script>



<style lang="less">

  @import "../../assets/styles/color";

</style>