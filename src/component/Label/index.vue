<template lang="jade">

  .soil-label(:class="classObject", @click="$emit('click')") {{ label }}

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    props:
      'label':
        type: String
        default: ''
      'ellipsis':
        type: Boolean
        default: false

    computed:
      'classObject': ->
        '-ellipsis': @ellipsis

</script>



<style lang="less">

  @import "../../asset/style/color";

  .soil-label{
    color: inherit;
    white-space: nowrap;
    overflow: hidden;

    &.-ellipsis{
      text-overflow: ellipsis;
    }
  }

</style>