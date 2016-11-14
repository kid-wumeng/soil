<template lang="jade">

  .soil-input(:class="classObject", @click.stop="onClick")

    left-area(v-if="display.left")
      slot(name="left")

    write-area(
      ref="write-area",
      :value="value",
      :placeholder="hint",
      :type="nativeType",
      :disabled="nativeDisabled",
      @input="onInput",
    )

    dropdown-area(v-if="display.dropdown")
      slot(name="dropdown")

    right-area(v-if="display.right")
      slot(name="right")

</template>



<script lang="coffee">

  Soil = require '../../Soil'

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
      'autoDropdown':
        type: Boolean
        default: true


    data: ->
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

      'display': ->
        'left':     @$slots['left']     isnt undefined
        'right':    @$slots['right']    isnt undefined
        'dropdown': @$slots['dropdown'] isnt undefined and @dropdownOpen


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

      'onInput': (value) ->
        if @trim
          value = value.replace /(^\s+)|(\s+$)/g, ''
        if value isnt @value
          @$emit('input', value)

      'focus': ->
        @$refs['write-area'].$el.focus()

      'showDropdown': ->
        @dropdownOpen = true

      'hideDropdown': ->
        @dropdownOpen = false

</script>



<style lang="less">

  @import "../../asset/style/color";

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