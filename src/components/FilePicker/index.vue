<template lang="jade">

  .soil-file-picker
    .wrap(@click="onClick")
      slot
    input(ref="input", type="file", :accept="accept", @change="onChange")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

      'mimes':
        type: Array
        default: -> []

      'minSize':
        type: Number
        default: 0

      'maxSize':
        type: Number
        default: 1024 * 1024  # 1 MB

      'dataUrl':
        type: Boolean
        default: false


    computed:

      'accept': -> @mimes.join(', ')


    methods:

      'loadDataURL': (file) ->
        reader = new FileReader
        reader.readAsDataURL file
        reader.onload = (event) =>
          dataURL = event.target.result
          this.$emit('load-data-url', { file, dataURL })

      'validate': (file) ->
        size = file.size
        if size < @minSize
          this.$emit('min-size-error', { file, minSize: @minSize })
        if size > @maxSize
          this.$emit('max-size-error', { file, maxSize: @maxSize })

      'onClick': ->
        this.$refs.input.click()

      'onChange': (event) ->
        file = event.target.files[0]
        if not @validate file
          return
        if @dataUrl
          @loadDataURL file

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-file-picker {
    display: inline-block;
    .wrap {
      cursor: pointer;
    }
    input {
      display: none;
    }
  }



</style>