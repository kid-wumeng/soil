<template lang="jade">
  soil-dialog.soil-message-dialog(
    :open="open",
    :alpha="alpha",
    :modal="modal",
    @input="$emit('input')",
    @click-mask="$emit('click-mask')"
  )
    c-title(
      v-if="title",
      :title="title"
    )
    message(
      v-if="message",
      :message="message"
    )
    action-bar(
      :label-ok="labelOk",
      @ok="$emit('ok')"
    )
</template>



<script lang="coffee">
  module.exports =

    components:
      'soil-dialog': require '../Dialog'
      'c-title':     require './Title'
      'message':     require './Message'
      'action-bar':  require './ActionBar'

    props:
      'open':
        type: Boolean
        default: false
      'title':
        type: String
        default: ''
      'message':
        type: String
        default: ''
      'labelOk':
        type: String
        default: 'OK'
      'alpha':
        type: Number
        default: 0.4
      'modal':
        type: Boolean
        default: false

    methods:
      'onClickMask': ->
        @$emit('click-mask')
        @$emit('ok') if not @modal
</script>



<style lang="less">
  .soil-message-dialog{
    >.panel{
      width: 280px;
      padding: 16px;
      >.title{
        margin-bottom: 16px;
      }
      >.action-bar{
        margin-top: 48px;
      }
    }
  }
</style>