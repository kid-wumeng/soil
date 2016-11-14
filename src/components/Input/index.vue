<template lang="jade">

  .soil-input(:class="classObject", @click.stop="onClick")

    left-area(v-if="$slots.left")
      slot(name="left")

    write-area(
      ref="write-area",
      :value="value",
      :placeholder="hint",
      :type="nativeType",
      :disabled="nativeDisabled",
      @input.native="onInput",
    )

    dropdown-area(v-if="$slots.dropdown && dropdownOpen")
      slot(name="dropdown")

    right-area(v-if="$slots.right")
      slot(name="right")

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'left-area':     require './LeftArea'
      'write-area':    require './WriteArea'
      'right-area':    require './RightArea'
      'dropdown-area': require './DropdownArea'


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
      'min':
        type: Number
        default: null
      'max':
        type: Number
        default: null
      'format':
        type: String
        default: null
      'valid':
        type: Function
        default: null
      'autoDropdown':
        type: Boolean
        default: true


    data: ->
      'lastValue': @value
      'dropdownOpen': false


    computed:
      'classObject': ->
        '-border':     @facade is 'border'
        '-underscore': @facade is 'underscore'
        '-dark':       @facade is 'dark'
        '-light':      @facade is 'light'
        '-mask':       @mask
        '-disabled':   @disabled

      'nativeType': ->
        switch
          when @mask then return 'password'
          else return 'text'

      'nativeDisabled': -> @passive or @disabled


    mounted: ->
      document.addEventListener 'click', @onClickOut


    destroyed: ->
      document.removeEventListener 'click', @onClickOut


    methods:
      'onClick': ->
        @focus()
        if @autoDropdown then @showDropdown()

      'onClickOut': ->
        if @autoDropdown then @hideDropdown()

      'onInput': (event) ->
        value = event.target.value
        if @trim
          value = value.replace /(^\s+)|(\s+$)/g, ''
        if @lastValue isnt value
           @lastValue = value
           @$emit('input', @lastValue)

      'check': ->
        @minCheck()
        @maxCheck()
        @formatCheck()
        @validCheck()

      'minCheck': ->
        if @min
          if @lastValue.length < @min
            @$emit('min-error', @lastValue)

      'maxCheck': ->
        if @max
          if @lastValue.length > @max
            @$emit('max-error', @lastValue)

      'formatCheck': ->
        switch @format
          when 'email'
            if util.isEmailAddress(@lastValue) is false
              @$emit('format-error', @lastValue)

      'validCheck': ->
        if @valid
          if @valid(@lastValue) is false
            @$emit('valid-error', @lastValue)

      'focus': ->
        @$refs['write-area'].$el.focus()

      'showDropdown': ->
        @dropdownOpen = true

      'hideDropdown': ->
        @dropdownOpen = false

</script>



<style lang="less">

  @import "../../assets/styles/color";

  @padding: 8px;

  .soil-input{
    width: 240px;
    display: flex;
    align-items: center;
    box-sizing: border-box;
    height: 32px;
    position: relative;
    >.write-area{
      margin-left: @padding;
      margin-right: @padding;
    }
    >.left-area{margin-left: @padding}
    >.right-area{margin-right: @padding}
    >.dropdown-area{
      position: absolute;
      top: 115%;
    }
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