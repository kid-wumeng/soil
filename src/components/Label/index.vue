<template lang="jade">

  .soil-label( :class="classObject" ) {{ text }}

</template>



<script lang="coffee">

  module.exports =

    props:

      'text':
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

  @import "../../assets/common";

  .soil-label {
    font-size: 14px;
    color: @soil-black;
    white-space: nowrap;
    overflow: hidden;

    &.-ellipsis {
      text-overflow: ellipsis;
    }
  }

</style>