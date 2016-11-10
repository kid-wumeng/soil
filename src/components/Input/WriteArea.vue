<template lang="jade">

  input.write-area(
    :type="type",
    :placeholder="hint",
    :disabled="passive || disabled",
    @input="$emit('input', $event.target.value)"
    @change="$emit('change')"
  )

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:
      'hint':
        type: String
        required: true
      'mask':
        type: Boolean
        required: true
      'passive':
        type: Boolean
        required: true
      'disabled':
        type: Boolean
        required: true

    computed:
      'type': ->
        switch
          when @mask then return 'password'
          else return 'text'

</script>



<style lang="less">

  @import "../../assets/styles/color";

  .soil-input{
    >.write-area{
      flex-grow: 1;
      height: 16px;
      line-height: 16px;
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