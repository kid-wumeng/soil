<template lang="jade">

  .soil-file-picker
    slot
    input(
      ref="input",
      type="file",
      :accept="accept",
      @change="onChange"
    )

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    props:
      'mimes':
        type: Array
        default: -> []
      'min':
        type: Number
        default: 0
      'max':
        type: Number
        default: 1024 * 1024 * 1024  # 1 MB
      'dataUrl':
        type: Boolean
        default: false


    computed:
      'accept': -> @mimes.join(', ')


    mounted: ->
      children = @$slots['default'] ? []
      for child in children
        child.elm.addEventListener('click', @onClick)


    methods:
      'onClick': ->
        this.$refs.input.click()

      'onChange': (event) ->
        file = event.target.files[0]
        @check(file)
        @load(file)

      'check': (file) ->
        @mimesCheck(file)
        @minCheck(file)
        @maxCheck(file)

      'mimesCheck': (file) ->
        # @TODO Match the wildcard, such as 'image', 'image/*' ...
        if @mimes.length > 0
          include = @mimes.some (mime) -> file.type is mime
          if not include
            @$emit 'mime-error', {file, mimes: @mimes}
            throw  'mime-error'

      'minCheck': (file) ->
        if file.size < @min
          @$emit 'min-error', {file, min: @min}
          throw  'min-error'

      'maxCheck': (file) ->
        if file.size > @max
          @$emit 'max-error', {file, max: @max}
          throw  'max-error'

      'load': (file) ->
        data = { file }
        if @dataUrl
          data.dataUrl = null
          @loadDataUrl(data)
        @watch(data)

      'loadDataUrl': (data) ->
        reader = new FileReader()
        reader.readAsDataURL(data.file)
        reader.onload = (event) =>
          data.dataUrl = event.target.result
          @watch(data)

      'watch': (data) ->
        ready = true
        for type, value of data
          if value is null
            ready = false
            break
        if ready
          @$emit('load', data)

</script>



<style lang="less">

  @import "../../asset/style/color";

  .soil-file-picker{
    display: inline-block;
    > *{
      cursor: pointer;
    }
    input{
      display: none;
    }
  }

</style>