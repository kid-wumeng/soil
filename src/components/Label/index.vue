<template lang="jade">

  .soil-label(:class="classObject", @click="onClick") {{ label }}

</template>



<script lang="coffee">

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


    methods:

      'onClick': ->
        this.$emit('click')

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-label {
    color: @soil-black;
    white-space: nowrap;
    overflow: hidden;

    &.-ellipsis {
      text-overflow: ellipsis;
    }
  }

</style>