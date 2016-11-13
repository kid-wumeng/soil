<template lang="jade">

  soil-dialog.soil-message-dialog(
    ref="dialog",
    :hide-on-click-mask="hideOnClickMask",
    @show="$emit('show')",
    @hide="$emit('hide')",
  )
    c-title(v-if="title", :title="title")
    message(v-if="message", :message="message")
    action-bar(:sure-label="sureLabel", @sure="onSure")

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-dialog': require '../Dialog'
      'c-title':     require './Title'
      'message':     require './Message'
      'action-bar':  require './ActionBar'

    props:
      'title':
        type: String
        default: ''
      'message':
        type: String
        default: ''
      'sureLabel':
        type: String
        default: 'OK'
      'hideOnClickMask':
        type: Boolean
        default: false

    methods:
      'show': ->
        @$refs.dialog.show()
      'hide': ->
        @$refs.dialog.hide()
      'onSure': ->
        @hide()
        @$emit('sure')

</script>



<style lang="less">

  @import "../../assets/styles/color";

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