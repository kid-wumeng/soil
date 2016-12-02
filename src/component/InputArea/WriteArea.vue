<template lang="jade">

  textarea.write-area(
    :value="value",
    :style="styleObject",
    @input="onInput"
  )

</template>



<script lang="coffee">

  module.exports =

    props:
      'value':
        type: String
        required: ''
      'rows':
        type: Number
        required: true

    computed:
      'styleObject': ->
        'height': "#{@rows*16}px"

    methods:
      'onInput': (event) ->
        @$emit('input', event.target.value)

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-input-area{
    >.write-area{
      display: block;
      width: 100%;
      text-align: justify;
      font-size: 12px;
      line-height: 16px;
      background-color: transparent;
      border: none;
      resize:none;
      -webkit-font-smoothing: subpixel-antialiased;
    }
    &.-border{
      >.write-area{color: @soil-black-light}
      >.write-area::placeholder{color: @soil-gray-5}
    }
    &.-light{
      >.write-area{color: @soil-black-light}
      >.write-area::placeholder{color: @soil-gray-4}
    }
    &.-dark{
      >.write-area{color: @soil-black-light}
      >.write-area::placeholder{color: @soil-gray-5}
    }
    &.-disabled{
      >.write-area{color: @soil-gray-4; cursor: not-allowed}
      >.write-area::placeholder{color: @soil-gray-2}
    }
  }

</style>