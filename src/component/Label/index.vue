<template lang="jade">

  .soil-label(:class="classObject", @click="$emit('click')") {{ label }}

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

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-label{
    display: inline-flex;
    align-items: center;
    height: 100%;
    font-size: 14px;
    color: @soil-black;
    white-space: nowrap;
    overflow: hidden;

    &.-ellipsis{
      text-overflow: ellipsis;
    }
  }

</style>