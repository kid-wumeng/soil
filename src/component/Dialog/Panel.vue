<template lang="jade">

  .panel
    slot

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    props:
      'padding':
        type: Number
        default: 0

    computed:
      'styleObject': ->
        'padding': @padding

</script>



<style lang="less">

  .soil-dialog{
    >.panel{
      background-color: white;
      border-radius: 2px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    }
  }

</style>