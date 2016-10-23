<template lang="jade">

  .soil-file-picker
    .wrap(@click="_onClick")
      slot
    input(ref="input", type="file", @change="_onChange")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

      'dataUrl':
        type: Boolean
        default: false


    methods:

      'loadDataURL': (file) ->
        reader = new FileReader
        reader.readAsDataURL file
        reader.onload = (event) =>
          dataURL = event.target.result
          this.$emit('load-data-url', { file, dataURL })

      '_onClick': ->
        this.$refs.input.click()

      '_onChange': (event) ->
        file = event.target.files[0]
        if @dataUrl
          @loadDataURL file

</script>



<style lang="less" scoped>

  @import "../../assets/styles/color";

  .soil-file-picker {
    display: inline-block;
    input {
      display: none;
    }
  }



</style>