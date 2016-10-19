<template lang="jade">

  .soil-input( :class="classObject" )
    .box( @click="onClick" )
      soil-icon.icon( v-if="icon", :name="icon" )
      soil-label.label( v-if="label", :text="label" )
      input.paper(
        spellcheck="false",
        :value="value",
        :type="nativeType",
        :placeholder="hint",
        :disabled="passive || disabled",
        @focus="onFocus",
        @input="onInput",
        @change="onChange"
      )
    .error-message( v-show="errorMessage", v-html="errorMessage" )

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    props:

      'value':
        type: String

      'icon':
        type: String
        default: null

      'label':
        type: String
        default: null

      'hint':
        type: String
        default: ''

      'format':
        type: [String, Function]
        default: null

      'format-error-message':
        type: String
        default: null

      'error-message-fly':
        type: Boolean
        default: false

      'type':
        # border | underscore | light | dark
        type: String
        default: 'border'

      'password':
        type: Boolean
        default: false

      'passive':
        type: Boolean
        default: false

      'disabled':
        type: Boolean
        default: false

      'no-trim':
        type: Boolean
        default: false


    data: ->

      '_value': @value

      '_hasFormatError': false


    computed:

      'nativeType': ->
        if @password
          return 'password'
        else
          return 'text'

      'classObject': ->
        '-border':     @type is 'border'
        '-underscore': @type is 'underscore'
        '-dark':       @type is 'dark'
        '-light':      @type is 'light'
        '-password': @password
        '-passive':  @passive
        '-disabled': @disabled
        '-error-message-fly': @errorMessageFly

      'errorMessage': ->
        messages = []
        if this.$data._hasFormatError
          messages.push util.n2br(@formatErrorMessage)
        return messages.join('<br/>')


    methods:

      'onClick': (event) ->
        this.$emit('click')


      'onFocus': (event) ->
        this.$emit('focus')


      'onInput': (event) ->
        value = event.target.value
        if @noTrim
          this.$data._value = value
          this.$emit('input', value)
        else
          value = value.replace /(^\s+)|(\s+$)/g, ''
          if value isnt this.$data._value
            this.$data._value = value
            this.$emit('input', value)


      'onChange': ->
        value = this.$data._value
        if value is '' or @validateFormat(value)
          this.$data._hasFormatError = false
        else
          this.$data._hasFormatError = true
          this.$emit('format-error', value)
        this.$emit('change', value)


      'validateFormat': (value) ->
        return true if not @format
        if @format is 'email'
          return true if util.isEmailAddress(value)
        else
          return true if @format(value)
        return false

</script>



<style lang="less">

  @import "../../assets/common";

  .soil-input {
    display: inline-block;
    width: 300px;
    -webkit-tap-highlight-color: transparent;
    position: relative;
  }

  .soil-input > .box {
    display: inline-flex;
    align-items: center;
    box-sizing: border-box;
    padding-left: 8px;
    padding-right: 8px;
    width: 100%;
    height: 32px;
    border-width: 1px;
    border-style: solid;
    border-radius: 2px;
  }

  [soil-dpr="2"] .soil-input > .box,
  [soil-dpr="3"] .soil-input > .box {
    border-width: 0.5px;
  }

  .soil-input > .box > .icon {
    margin-right: 8px;
    height: 16px;
    line-height: 16px;
    font-size: 14px;
  }

  .soil-input > .box > .label {
    margin-right: 8px;
    height: 16px;
    line-height: 16px;
    font-size: 14px;
  }

  .soil-input > .box > .paper {
    flex-grow: 1;
    height: 16px;
    line-height: 16px;
    font-size: 14px;
    overflow: hidden;
    background-color: transparent;
    border: none;
  }

  .soil-input > .error-message {
    box-sizing: border-box;
    margin-top: 8px;
    padding-left: 8px;
    padding-right: 8px;
    width: 100%;
    line-height: 1.5;
    font-size: 12px;
    color: @soil-red;
  }

  .soil-input.-error-message-fly > .error-message {
    position: absolute;
  }

  .soil-input.-border {
    > .box {
      border-color: @soil-gray-5;
      background-color: white;
      > .icon  { color: @soil-gray-7 }
      > .label { color: @soil-gray-7 }
      > .paper { color: @soil-black-light }
      > .paper::placeholder { color: @soil-gray-4 }
    }
  }

  .soil-input.-underscore {
    > .box {
      border-left-color:  transparent;
      border-right-color: transparent;
      border-top-color:   transparent;
      border-bottom-color: @soil-gray-3;
      background-color: white;
      > .icon  { color: @soil-gray-7 }
      > .label { color: @soil-gray-7 }
      > .paper { color: @soil-black-light }
      > .paper::placeholder { color: @soil-gray-4 }
    }
  }

  .soil-input.-light {
    > .box {
      border-color: transparent;
      background-color: white;
      > .icon  { color: @soil-gray-7 }
      > .label { color: @soil-gray-7 }
      > .paper { color: @soil-black-light }
      > .paper::placeholder { color: @soil-gray-4 }
    }
  }

  .soil-input.-dark {
    > .box {
      border-color: transparent;
      background-color: @soil-gray-2;
      > .icon  { color: @soil-gray-8 }
      > .label { color: @soil-gray-8 }
      > .paper { color: @soil-black-light }
      > .paper::placeholder { color: @soil-gray-5 }
    }
  }

  .soil-input.-disabled {
    &.-border,
    &.-underscore,
    &.-light,
    &.-dark {
      > .box {
        background-color: white;
        cursor: not-allowed;
        > .icon  { color: @soil-gray-2 }
        > .label { color: @soil-gray-2 }
        > .paper { color: @soil-gray-4; cursor: not-allowed; }
        > .paper::placeholder { color: @soil-gray-1 }
      }
    }
    &.-border,
    &.-light,
    &.-dark {
      > .box {
        border-style: dashed;
        border-color: @soil-gray-2;
      }
    }
    &.-underscore {
      > .box {
        border-bottom-style: dashed;
        border-bottom-color: @soil-gray-2;
      }
    }
  }

</style>