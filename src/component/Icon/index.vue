<template lang="jade">

  .soil-icon(
    :class="className",
    :style="styleObject"
    @click="$emit('click')"
  )

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    props:
      'family':
        type: String
        default: 'soil'
      'name':
        type: String
        required: true

    computed:
      'className': -> "icon-#{@family}-#{@name}"
      'styleObject': ->
        'font-family': @family

</script>



<style lang="less">

  @import "../../asset/style/icon-font";
  @import "../../asset/style/color";

  .soil-icon{
    display: inline-block;
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    color: inherit;
    speak: none;
    text-decoration: inherit;
    text-align: center;
    font-variant: normal;
    text-transform: none;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

</style>