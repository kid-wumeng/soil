<template lang="jade">

  soil-dialog.soil-message-dialog(ref="dialog")
    .title(
      v-if="title"
    ) {{ title }}
    .message(
      v-if="message"
    ) {{ message }}
    soil-button(
      slot="bar-right",
      :label="sureLabel",
      facade="nude",
      @click="onSure"
    )

</template>



<script lang="coffee">

  util = require '../../assets/util'

  module.exports =

    components:
      'soil-dialog': require '../Dialog'
      'soil-button': require '../Button'

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
    .content-area{
      width: 280px;
      min-height: 48px;
      .title{
        margin-bottom: 12px;
        font-size: 12px;
        color: @soil-gray-6;
      }
      .message{
        font-size: 14px;
        color: @soil-black-light;
      }
    }
    .bar{
      margin-top: 32px;
      .soil-button{
        padding: 0;
        font-size: 14px;
        -webkit-font-smoothing: subpixel-antialiased;
      }
    }
  }

</style>