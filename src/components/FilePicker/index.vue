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
        default: 1024 * 1024 * 1024  # 1 MB
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

      'valid': (file) ->
        try
          @validMimes(file)
          @validMinSize(file)
          @validMaxSize(file)
          return true
        catch error
          this.$emit(error.type, error)
          return false

      'validMimes': (file) ->
        # @TODO Match the wildcard, such as 'image', 'image/*' ...
        if @mimes.length > 0
          include = @mimes.some (mime) -> file.type is mime
          if not include
            error = {}
            error.type = 'mime-error'
            error.file = file
            error.mimes = @mimes
            throw error

      'validMinSize': (file) ->
        if file.size < @minSize
          error = {}
          error.type = 'min-size-error'
          error.file = file
          error.minSize = @minSize
          throw error

      'validMaxSize': (file) ->
        if file.size > @maxSize
          error = {}
          error.type = 'max-size-error'
          error.file = file
          error.maxSize = @maxSize
          throw error

      'onClick': ->
        this.$refs.input.click()

      'onChange': (event) ->
        file = event.target.files[0]
        if not @valid file
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