<template lang="jade">

  .soil-image(:class="classObject", :style="styleObject")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:
      'src':
        type: String
        default: null
      'width':
        type: String
        default: null
      'height':
        type: String
        default: null
      # @TODO Automatically set to square
      'circle':
        type: Boolean
        default: false


    computed:
      'classObject': ->
        '-circle': @circle
      'styleObject': ->
        backgroundImage: "url(#{@src})"


    mounted: ->
      this._loadImage()


    updated: ->
      this._loadImage()


    methods:
      '_loadImage': ->
        img = new Image
        img.src = @src
        img.onload = (event) =>
          this.$el.style.width = @width ? "#{img.width}px"
          this.$el.style.height = @height ? "#{img.height}px"

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-image {
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    transition: width 0.5s ease, height 0.5s ease;
    &.-circle {
      border-radius: 100%;
    }
  }

</style>