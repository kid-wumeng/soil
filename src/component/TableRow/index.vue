<template lang="jade">

  .soil-table-row(:class="classObject")
    slot

</template>



<script lang="coffee">

  module.exports =

    props:
      'title':
        type: Boolean
        default: false

    computed:
      'classObject': ->
        '-title': @title

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-table-row{
    display: table-row;
    transition: background-color 0.3s ease;
    &:hover:not(.-title){
      background-color: #F9F9F9;
    }
    &.-title{
      font-weight: bold;
      background-color: @soil-gray-1;
    }
  }

</style>