<template lang="jade">

  .soil-icon
    .icon(:class="iconClass", :style="iconStyleObject")
    soil-label.label(v-if="label", :text="label", :style="iconStyleObject")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

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

      'iconClass': ->
        return "soil-icon-#{@name}"

      'iconStyleObject': ->
        color: util.color(@color)

      'labelStyleObject': ->
        color: util.color(@color)

</script>



<style lang="less">

  @import "../../assets/common";

  .soil-icon {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
  }

  .soil-icon > .icon {
    display: inline-block;
    font-size: 24px;
    color: @soil-gray-8;
  }

  .soil-icon > .label {
    margin-top: 6px;
    font-size: 12px;
    color: @soil-gray-8;
  }

</style>