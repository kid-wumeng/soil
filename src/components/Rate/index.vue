<template lang="jade">

  .soil-rate(:rate="value")
    soil-list-x(padding="8px")
      soil-icon.icon(
        v-for="i in count",
        name="star-solid",
        :class="iconClassObjects[i]",
        @click="onSelect(i)"
      )

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:
      'value':
        type: Number
        default: 0
      'count':
        type: Number
        default: 5


    computed:
      'iconClassObjects': ->
        classObjects = []
        for i in [1..@count]
          classObjects[i] =
            '-active': i <= @value
        return classObjects


    methods:
      'onSelect': (i) ->
        this.$emit 'input', i

</script>



<style lang="less">

  @import "../../assets/style/color";

  .soil-rate{
    .soil-icon{
      font-size: 24px;
      cursor: pointer;
      color: @soil-gray-5;
      &.-active{ color: @soil-yellow; }
    }
  }

</style>