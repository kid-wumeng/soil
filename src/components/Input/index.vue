<template lang="jade">

  .soil-input(:class="classObject")
    slot(name="left")
    write-area(
      :hint="hint",
      :mask="mask",
      :trim="trim",
      :passive="passive",
      :disabled="disabled",
      @input="onInput"
      @change="onChange"
    )
    slot(name="right")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'write-area': require './WriteArea'


    props:
      'value':
        type: String
        default: ''
      'facade':
        # border | underscore | light | dark
        type: String
        default: 'border'
      'hint':
        type: String
        default: ''
      'mask':
        type: Boolean
        default: false
      'trim':
        type: Boolean
        default: true
      'passive':
        type: Boolean
        default: false
      'disabled':
        type: Boolean
        default: false
      'format':
        type: String
        default: null
      'valid':
        type: Function
        default: null


    data: ->
      'lastValue': @value


    computed:
      'classObject': ->
        '-border':     @facade is 'border'
        '-underscore': @facade is 'underscore'
        '-dark':       @facade is 'dark'
        '-light':      @facade is 'light'
        '-mask':     @mask
        '-disabled': @disabled


    methods:
      'onInput': (value) ->
        if @trim
          value = value.replace /(^\s+)|(\s+$)/g, ''
        if @lastValue isnt value
           @lastValue = value
           @$emit('input', @lastValue)

      'onChange': ->
        @formatCheck()
        @validCheck()
        @$emit('change', @lastValue)

      'formatCheck': ->
        switch @format
          when 'email'
            if util.isEmailAddress(@lastValue) is false
              @$emit('format-error', @lastValue)

      'validCheck': ->
        if @valid
          if @valid(@lastValue) is false
            @$emit('valid-error', @lastValue)

</script>



<style lang="less">

  @import "../../assets/styles/color";

  @padding: 8px;

  .soil-input{
    width: 300px;
    display: flex;
    align-items: center;
    box-sizing: border-box;
    height: 32px;
    >.write-area{
      margin-left: @padding;
      margin-right: @padding;
    }
    >:first-child:not(.write-area){margin-left: @padding}
    >:last-child:not(.write-area){margin-right: @padding}
    &.-border{
      background-color: transparent;
      border: 1px solid @soil-gray-4;
      border-radius: 3px;
    }
    &.-underscore{
      background-color: transparent;
      border-bottom: 1px solid @soil-gray-1;
    }
    &.-light{
      background-color: white;
      border-color: transparent;
      border-radius: 3px;
    }
    &.-dark{
      background-color: @soil-gray-2;
      border-color: transparent;
      border-radius: 3px;
    }
    &.-dark{
      background-color: @soil-gray-2;
      border-color: transparent;
      border-radius: 3px;
    }
    &.-disabled{
      border-style: dashed;
      border-color: @soil-gray-2;
    }
  }

  [soil-dpr="2"] .soil-input,
  [soil-dpr="3"] .soil-input{
    border-width: 0.5px;
  }

</style>