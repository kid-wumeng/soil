<template lang="jade">

  .soil-icon(:class="className", :style="styleObject", @click="onClick")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

      'family':
        type: String
        default: 'soil'

      'name':
        type: String
        required: true

      'label':
        type: String
        default: null

      'color':
        type: String
        default: null

    computed:

      'className': ->
        return "icon-#{@family}-#{@name}"

      'styleObject': ->
        color: util.color @color

      'labelStyleObject': ->
        color: util.color @color

    methods:
      'onClick': -> this.$emit 'click'

</script>



<style lang="less">

  @import "../../assets/styles/icon";
  @import "../../assets/styles/color";

  .soil-icon {
    font-size: 16px;
    color: inherit;
  }

</style>