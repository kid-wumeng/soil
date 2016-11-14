<template lang="jade">

  input.write-area(@input="onInput")

</template>



<script lang="coffee">

  module.exports =

    methods:
      'onInput': (event) ->
        @$emit('input', event.target.value)

</script>



<style lang="less">

  @import "../../assets/style/color";

  .soil-input{
    >.write-area{
      flex-grow: 1;
      height: 32px;
      font-size: 12px;
      overflow: hidden;
      background-color: transparent;
      border: none;
    }
  }

  .soil-input.-border{
    >.write-area{color: @soil-black}
    >.write-area::placeholder{color: @soil-gray-5}
  }
  .soil-input.-underscore{
    >.write-area{color: @soil-black}
    >.write-area::placeholder{color: @soil-gray-4}
  }
  .soil-input.-light{
    >.write-area{color: @soil-black}
    >.write-area::placeholder{color: @soil-gray-4}
  }
  .soil-input.-dark{
    >.write-area{color: @soil-black}
    >.write-area::placeholder{color: @soil-gray-5}
  }
  .soil-input.-disabled{
    >.write-area{color: @soil-gray-4; cursor: not-allowed}
    >.write-area::placeholder{color: @soil-gray-2}
  }

</style>