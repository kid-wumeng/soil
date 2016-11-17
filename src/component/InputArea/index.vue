<template lang="jade">

  .soil-input-area(:class="classObject")
    write-area(
      ref="write-area",
      :value="value",
      :placeholder="hint",
      :rows="rows",
      :disabled="disabled",
      @input="onInput",
    )
    counter(
      :count="count",
      :max="max",
    )

</template>



<script lang="coffee">

  module.exports =

    components:
      'counter':      require './Counter'
      'write-area': require './WriteArea'


    props:
      'value':
        type: String
        default: ''
      'facade':
        # border | light | dark
        type: String
        default: 'dark'
      'hint':
        type: String
        default: ''
      'rows':
        type: Number
        default: 5
      'trim':
        type: Boolean
        default: true
      'max':
        type: Number
        default: 300
      'countMode':
        type: Function
        default: (char) -> 1
      'disabled':
        type: Boolean
        default: false


    computed:
      'classObject': ->
        '-border':     @facade is 'border'
        '-dark':       @facade is 'dark'
        '-light':      @facade is 'light'
        '-disabled':   @disabled

      'count': -> @countValue(@value)


    methods:
      'countValue': (value) ->
        count = 0
        for word in value
          count += @countMode word
        return count

      'onInput': (value) ->
        if @trim
          value = value.replace /(^\s+)|(\s+$)/g, ''
        if value isnt @value
          @$emit('input', value)

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-input-area{
    box-sizing: border-box;
    width: 240px;
    padding: 6px;
    &.-border{
      background-color: transparent;
      border: 1px solid @soil-gray-4;
    }
    &.-light{
      background-color: white;
      border-color: transparent;
    }
    &.-dark{
      background-color: @soil-gray-2;
      border-color: transparent;
    }
    &.-disabled{
      border-style: dashed;
      border-color: @soil-gray-2;
    }
    .counter{
      margin-top: 8px;
    }
  }

  [soil-dpr="2"] .soil-input-area,
  [soil-dpr="3"] .soil-input-area{
    border-width: 0.5px;
  }

</style>