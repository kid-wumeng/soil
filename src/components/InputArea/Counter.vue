<template lang="jade">

  .counter(:class="classObject")
    .count {{ count }}
    .sep /
    .total {{ total }}

</template>



<script lang="coffee">

  module.exports =

    props:
      'count':
        type: Number
        required: true
      'total':
        type: Number
        required: true

    computed:
      'classObject': ->
        '-over': @count > @total

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-input-area{
    .counter{
      display: flex;
      justify-content: flex-end;
      font-size: 12px;
      color: @soil-gray-6;
      -webkit-font-smoothing: subpixel-antialiased;
      .count{ margin-right: 4px }
      .sep{ margin-right: 4px }
    }
    .counter.-over{
      .count{ color: @soil-red }
    }
  }

</style>