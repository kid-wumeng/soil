<template lang="jade">

  .soil-label(:class="classObject", @click="onClick") {{ text }}

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


    methods:

      'onClick': ->
        this.$emit('click')

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

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