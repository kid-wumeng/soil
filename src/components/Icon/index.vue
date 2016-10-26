<template lang="jade">

  .soil-icon(@click="onClick")
    .icon(:class="iconClassName", :style="iconStyleObject")
    soil-label.label(v-if="label", :text="label", :style="iconStyleObject")

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

      'iconClassName': ->
        return "icon-#{@family}-#{@name}"

      'iconStyleObject': ->
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
    text-align: center;
    font-size: 16px;
    color: inherit;
  }

  .soil-icon > .icon {
    width: 100%;
  }

  .soil-icon > .label {
    margin-top: 6px;
    width: 100%;
    font-size: 12px;
  }

</style>