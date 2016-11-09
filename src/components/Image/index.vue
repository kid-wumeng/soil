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
      this.loadImage()


    updated: ->
      this.loadImage()


    methods:
      'loadImage': ->
        img = new Image
        img.src = @src
        img.onload = =>
          width  = if @width  then @width  else img.width
          height = if @height then @height else img.height
          if @circle
            if width > height then width = height else height = width
          @$el.style.width  = "#{width}px"
          @$el.style.height = "#{height}px"

</script>



<style lang="less" scoped>

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