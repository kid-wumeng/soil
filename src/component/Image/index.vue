<template lang="jade">

  .soil-image(:class="classObject", :style="styleObject")

</template>



<script lang="coffee">

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
      'circle':
        type: Boolean
        default: false


    computed:
      'classObject': ->
        '-circle': @circle
      'styleObject': ->
        backgroundImage: "url(#{@src})"


    mounted: ->
      this.loadImage()


    updated: ->
      this.loadImage()


    methods:
      'loadImage': ->
        img = new Image
        img.src = @src
        img.onload  = => @initSize(img)
        img.onerror = => @initSize({width: 0, height: 0})

      'initSize': (img) ->
        width  = if @width  then @width  else "#{img.width}px"
        height = if @height then @height else "#{img.height}px"

        @$el.style.width  = width
        @$el.style.height = height

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-image{
    display: inline-block;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    &.-circle{
      border-radius: 100%;
    }
  }

</style>