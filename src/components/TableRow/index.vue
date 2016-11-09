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

  @import "../../assets/styles/color";

  .soil-table-row{
    display: table-row;
    transition: background-color 0.3s ease;
    &:hover{
      background-color: #F8F8FF;
    }
    &.-title{
      font-weight: bold;
      background-color: @soil-gray-1;
    }
  }

</style>