<template lang="jade">

  .soil-button( :class="classObject", @click="onClick" )
    soil-label( :text="text" )

</template>



<script lang="coffee">

  module.exports =

    props:

      'text':
        type: String
        required: true

      'type':
        type: String
        default: 'solid'

      'disabled':
        type: Boolean
        default: false

      'color':
        type: String
        default: 'blue'

    computed:

      'classObject': ->
        '-solid':  @type is 'solid'
        '-border': @type is 'border'
        '-nude':   @type is 'nude'
        '-red':    @color is 'red'
        '-green':  @color is 'green'
        '-blue':   @color is 'blue'
        '-yellow': @color is 'yellow'
        '-disabled': @disabled

    methods:

      'onClick': ->
        if not @disabled
          this.$emit('click')

</script>



<style lang="less">

  @import "../../assets/common";

  .soil-button {
    display: inline-flex;
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    padding: 8px 16px;
    border-width: 1px;
    border-style: solid;
    border-radius: 2px;
    cursor: pointer;
    user-select: none;
    -webkit-tap-highlight-color: transparent;
  }

  [soil-dpr="2"] .soil-button,
  [soil-dpr="3"] .soil-button {
    border-width: 0.5px;
  }

  .soil-button.-red {
    background-color: @soil-red;
    border-color: @soil-red;
    > .soil-label { color: @soil-red }
  }

  .soil-button.-green {
    background-color: @soil-green;
    border-color: @soil-green;
    > .soil-label { color: @soil-green }
  }

  .soil-button.-blue {
    background-color: @soil-blue;
    border-color: @soil-blue;
    > .soil-label { color: @soil-blue }
  }

  .soil-button.-yellow {
    background-color: @soil-yellow;
    border-color: @soil-yellow;
    > .soil-label { color: @soil-yellow }
  }

  .soil-button.-disabled {
    background-color: @soil-gray;
    border-color: @soil-gray;
    > .soil-label { color: @soil-gray }
  }

  .soil-button.-solid {
    > .soil-label { color: white }
  }

  .soil-button.-border {
    background-color: transparent;
  }

  .soil-button.-nude {
    background-color: transparent;
    border-color: transparent;
  }

</style>